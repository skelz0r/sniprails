class CommandStep < ApplicationRecord
  validates :position,
    presence: true,
    uniqueness: { scope: :generator_id },
    numericality: { only_integer: true, greater_than_or_equal_to: 1 }

  validates :properties, json: { schema: -> { json_schema } }, if: :json_schema_exists?

  belongs_to :generator,
    inverse_of: :commands

  after_initialize :affect_latest_position, if: :new_record?

  def arguments
    properties['arguments']
  end

  protected

  def method_name
    fail NotImplementedError
  end

  private

  def affect_latest_position
    return if position.present? || generator.blank?

    position || (generator.steps.maximum(:position).to_i + 1)
  end

  def kind
    type.demodulize.underscore
  end

  def json_schema
    JSON.parse(File.read(json_schema_file))
  end

  def json_schema_exists?
    File.exist?(json_schema_file)
  end

  def json_schema_file
    Rails.root.join('config', 'schemas', 'command_steps', "#{kind}.json")
  end
end
