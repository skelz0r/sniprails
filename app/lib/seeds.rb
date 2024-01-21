require 'yaml'
require 'erb'

class Seeds
  def perform
    generators.each do |generator_attributes|
      generator = Generator.new(
        generator_attributes.except('commands')
      )

      generator_attributes['commands'].each do |command_attributes|
        generator.commands << CommandStep.new(
          type: "CommandStep::#{command_attributes['type'].classify}",
          properties: command_attributes['properties'],
          generator:,
        )
      end

      generator.save!
    end
  end

  def flushdb
    raise 'Not in production!' if production?

    load_all_models!

    ActiveRecord::Base.connection.transaction do
      ApplicationRecord.descendants.each(&:delete_all)
    end
  end

  private

  def production?
    Rails.env.production?
  end

  def generators
    YAML.load(generators_raw)
  end

  def generators_raw
    @generators_raw ||= ERB.new(Rails.root.join('db/generators.yml.erb').read).result
  end

  def load_all_models!
    Dir[Rails.root.join('app/models/**/*.rb')].each do |file|
      require file
    end
  end
end
