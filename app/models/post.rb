class Post < ActiveRecord::Base
  has_many :comments
  has_many :post_tags
  has_many :tags, through: :post_tags
  has_many :post_votes
  belongs_to :user
  has_many :answers, class_name: "Post", foreign_key: "question_id"
  belongs_to :question, class_name: "Post"
end
