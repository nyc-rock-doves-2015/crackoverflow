class Post < ActiveRecord::Base
  has_many :comments
  has_many :post_tags
  has_many :tags, through: :post_tags
  has_many :post_votes
  belongs_to :user
  has_many :answers, class_name: "Post", foreign_key: "question_id"
  belongs_to :question, class_name: "Post"
  has_many :favorites
  has_many :favorited_users, through: :favorites, source: :user

  validates :content, presence: true

  def all_tags=(names)
    self.tags = names.split(", ").map do |name|
      Tag.where(name: name.strip).first_or_create!
    end
  end

  def all_tags
    self.tags.map(&:name).join(", ")
  end

  def update_reputation(dir)
    if dir == "up"
      self.reputation += 1
    else
      self.reputation -= 1
    end
    self.save
  end

  def age
    age_seconds = Time.now - created_at
    if age_seconds < 60
      "#{age_seconds.round} seconds"
    elsif age_seconds < 3600
      "#{(age_seconds/60).round} minutes"
    elsif age_seconds < 5400
      "1 hour"
    else
      "#{(age_seconds/3600).round} hours"
    end
  end

end
