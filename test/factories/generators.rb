FactoryBot.define do
  factory :generator do
    title { 'My command' }
    commands do
      [
        'echo "Hello world!"',
      ]
    end
  end
end
