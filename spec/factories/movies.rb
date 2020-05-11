FactoryBot.define do
  factory :movie do
    title { FFaker::Movie.title }
    plot { FFaker::Movie.title }
  end
end
