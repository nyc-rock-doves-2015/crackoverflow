class User < ActiveRecord::Base
  has_secure_password
  has_many :posts
  has_many :comments
  has_many :post_votes
  has_many :favorites
  has_many :favorite_questions, through: :favorites, source: :post

  def my_questions
    self.posts.where(question_id: nil)
  end

  def my_answers
    self.posts.where("question_id > ?", 0)
  end

end
