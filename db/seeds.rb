require 'faker'

5.times do
  User.create(name: Faker::Internet.user_name, password: "password")
end

6.times do
  Tag.create(name: Faker::Hacker.adjective)
end

15.times do
  user =  User.find(User.pluck(:id).sample)
  question = Post.create(title: Faker::Hacker.say_something_smart, content: Faker::Lorem.paragraph, user: user)
  (rand(4) + 1).times do
    answer_user = User.find(User.pluck(:id).sample)
    answer = question.answers.create(content: Faker::Lorem.paragraph, user: answer_user)
    3.times do
      comment_ans_user = User.find(User.pluck(:id).sample)
      answer.comments.create(content: Faker::Lorem.sentence, user: comment_ans_user)
    end
    (rand(9) + 1).times do
      rand(2) == 0 ? (vote = true) : (vote = false)
      post_vote_user = User.find(User.pluck(:id).sample)
      curr_vote = answer.post_votes.create(user: post_vote_user, vote: vote)
      if curr_vote.vote
        answer.reputation += 1
        answer.user.reputation += 1
        answer.save
        answer.user.save
      else
        answer.reputation -= 1
        answer.user.reputation -= 1
        answer.save
        answer.user.save
      end
    end
  end
  (rand(3) + 1).times do
    comment_quest_user = User.find(User.pluck(:id).sample)
    question.comments.create(content: Faker::Lorem.sentence, user: comment_quest_user)
  end
  3.times do
    question.tags << Tag.find(Tag.pluck(:id).sample)
  end
  (rand(9) + 1).times do
    rand(2) == 0 ? (vote = true) : (vote = false)
    post_vote_user = User.find(User.pluck(:id).sample)
    curr_vote = question.post_votes.create(user: post_vote_user, vote: vote)
    if curr_vote.vote
      question.reputation += 1
      question.user.reputation += 1
      question.save
      question.user.save
    else
      question.reputation -= 1
      question.user.reputation -= 1
      question.save
      question.user.save
    end
  end
end
