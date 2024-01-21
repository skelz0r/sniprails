FactoryBot.define do
  factory :command_step do
    generator

    create_file

    trait :create_file do
      type { 'CommandStep::CreateFile' }

      properties do
        {
          arguments: [
            'app/models/user.rb',
            'class User < ApplicationRecord; end'
          ],
        }
      end
    end

    trait :create_model do
      type { 'CommandStep::CreateModel' }

      properties do
        {
          arguments: [
            'user',
            'name:string',
          ],
        }
      end
    end

    trait :create_background_job_file do
      type { 'CommandStep::CreateBackgroundJobFile' }

      properties do
        {
          file_name: 'send_email',
          content: 'class SendEmailJob < ActiveJob; end'
        }
      end
    end
  end
end
