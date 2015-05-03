require 'faker'

FactoryGirl.define do
  factory :user do
    name Faker::Internet.user_name
    password "password"
  end

end
