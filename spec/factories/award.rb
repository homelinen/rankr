require "factory_girl"
require "faker"

FactoryGirl.define do
  factory :award do
    username { Faker::Company.name }
    match
    amount { rand(10) }
  end
end
