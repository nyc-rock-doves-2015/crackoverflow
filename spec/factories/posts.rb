require 'faker'

FactoryGirl.define do
  factory :question, class: Post do
    title Faker::Hacker.say_something_smart
    content Faker::Lorem.paragraph
    # Here you should be using the associations  command that's built into
    # FactoryGirl:
    # https://github.com/thoughtbot/factory_girl/blob/master/GETTING_STARTED.md
    user_id 1
  end

  factory :answer, class: Post do
    content Faker::Lorem.paragraph
    user # should look like this.
    question # should look like this.
  end

end
