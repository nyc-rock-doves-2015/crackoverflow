require 'bcrypt'

User.create(name: "ben", password: "test")
Post.create(title: "blah", content: "laskdfj", user_id: 1)
Post.create(title: "answer", content: "answer", user_id: 1, question_id: 1)
Comment.create(content:"question", post_id: 1, user_id: 1)
Comment.create(content:"question", post_id: 2, user_id: 1)
Tag.create(name: "tag")
PostTag.create(post_id: 1, tag_id: 1)
PostVote.create(post_id: 1, user_id: 1, vote: true)
