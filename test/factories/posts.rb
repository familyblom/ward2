# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :post do
    author "Ben"
    title "Welcome to my blog"
    body "This is the best post you'll read"
    featured true
    published_at Time.now + 10.minutes
  end
end
