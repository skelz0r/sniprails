FactoryBot.define do
  factory :generator do
    title { 'My command' }
    commands do
      [
        'create_file("app/models/user.rb", "class User < ApplicationRecord; end")',
      ]
    end
  end
end
