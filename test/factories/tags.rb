FactoryGirl.define do
  factory :tag do
    name { Faker::DizzleIpsum.word }
  end
end
