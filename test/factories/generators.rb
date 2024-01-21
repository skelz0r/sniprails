FactoryBot.define do
  factory :generator do
    title { 'My command' }

    after(:build) do |generator|
      generator.commands << build(:command_step, generator:)
    end
  end
end
