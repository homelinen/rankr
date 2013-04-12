require "factory_girl"
require "faker"

FactoryGirl.define do
  factory :match do
    name Faker::Company.name
    game Faker::Company.name
    tournament
    start { Date.today + rand(20).days }
    duration { (rand(2).hours + rand(60).minutes).to_i }
  end
end
