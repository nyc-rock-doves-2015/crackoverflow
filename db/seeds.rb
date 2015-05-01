require 'faker'

5.times do
  User.create(name: Faker::Name.name, password: "password")
end

6.times do
  Tag.create(name: Faker::Hacker.adjective)
end

# User.create(name: "ben", password: "test")

15.times do
  user =  User.find(User.pluck(:id).sample)
  question = Post.create(title: Faker::Company.bs, content: Faker::Lorem.paragraph, user: user)
  (rand(4) + 1).times do
    answer_user = User.find(User.pluck(:id).sample)
    answer = question.answers.create(content: Faker::Lorem.paragraph, user: answer_user)
    3.times do
      comment_ans_user = User.find(User.pluck(:id).sample)
      answer.comments.create(content: Faker::Lorem.sentence, user: comment_ans_user)
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
    rand(1) == 0 ? (vote = true) : (vote = false)
    post_vote_user = User.find(User.pluck(:id).sample)
    question.post_votes.create(user: post_vote_user, vote: vote)
  end
end
# Post.create(title: "blah", content: "laskdfj", user_id: 1)
# Post.create(title: "answer", content: "answer", user_id: 1, question_id: 1)
# Comment.create(content:"question", post_id: 1, user_id: 1)
# Comment.create(content:"question", post_id: 2, user_id: 1)
# Tag.create(name: "tag")
# PostTag.create(post_id: 1, tag_id: 1)
# PostVote.create(post_id: 1, user_id: 1, vote: true)
