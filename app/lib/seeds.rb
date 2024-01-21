class Seeds
  def perform
    Generator.create!(
      title: 'Create user model',
      commands: [
        {
          method: 'create_file',
          args: [
            'app/models/user.rb',
            'class User < ApplicationRecord; end',
          ]
        }
      ],
    )
  end

  def flushdb
    raise 'Not in production!' if production?

    load_all_models!

    ActiveRecord::Base.connection.transaction do
      ApplicationRecord.descendants.each(&:delete_all)
    end
  end

  def production?
    Rails.env.production?
  end

  def load_all_models!
    Dir[Rails.root.join('app', 'models', '**', '*.rb')].each do |file|
      require file
    end
  end
end
