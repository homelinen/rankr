require "factory_girl"
require "faker"

FactoryGirl.define do
  factory :tournament do
    name Faker::Company.name + " tournament"
    user
    start { Date.today + rand(20).days }
  end
end
