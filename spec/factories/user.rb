require "factory_girl"
require "faker"

FactoryGirl.define do
  factory :user do
    username { %Q( #{Faker::Name.first_name} #{Faker::Name.last_name} ) }
    email { Faker::Internet.email }
    password 'littlesekret'
    password_confirmation 'littlesekret'
  end
end
