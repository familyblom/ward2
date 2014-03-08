# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :post do
    author { Faker::Name.name }
    title   { Faker::HipsterIpsum.phrase.slice(0..64) }
    body    { Faker::DizzleIpsum.paragraph }
    featured false
    published_at {Time.now + 10.minutes}
  end
end
