require 'faker'

FactoryGirl.define do
  factory :question, class: Post do
    title Faker::Hacker.say_something_smart
    content Faker::Lorem.paragraph
    user_id 1
  end

  factory :answer, class: Post do
    content Faker::Lorem.paragraph
    user_id 1
    question_id 1
  end

end
