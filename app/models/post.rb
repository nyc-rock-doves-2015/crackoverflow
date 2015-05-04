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

  def to_param
    "#{self.id}-#{self.title.parameterize}" if self.question == nil
  end

  def self.filter(filter)
    if filter == 'newest'
      Post.where(question_id: nil).order('created_at desc')
    elsif filter == 'oldest'
      Post.where(question_id: nil).order('created_at asc')
    elsif filter == 'unanswered'
      all_questions = Post.where(question_id: nil).order(reputation: :desc)
      unanswered_questions = all_questions.select do |question|
        question.answers.count == 0
      end
      unanswered_questions
    else filter == 'all'
      Post.where(question_id: nil).order(reputation: :desc)
    end
  end

  def self.search(search)
    if search
      Post.where('LOWER(title) LIKE ?', "%#{search.downcase}%")
    else
      Post.where(question_id: nil).order(reputation: :desc)
    end
  end

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
      self.user.reputation += 1
    else
      self.reputation -= 1
      self.user.reputation -= 1
    end
    self.save
    self.user.save
  end

  def age
    age_seconds = Time.now - created_at
    if age_seconds < 60
      "#{age_seconds.round} seconds"
    elsif age_seconds < 3600
      "#{(age_seconds/60).round} minutes"
    elsif age_seconds < 5400
      "1 hour"
    elsif age_seconds < 86400
      "#{(age_seconds/3600).round} hours"
    elsif age_seconds < 172800
      "1 day"
    else
      "#{(age_seconds/86400).round} days"
    end
  end

  def truncated_content
    word_arr = self.content.split(' ')
    word_arr.count > 13 ? word_arr.slice(0, 13).push('...').join(' ') : self.content
  end

  def get_vote(current_user)
    curr_vote = PostVote.find_by(post: self, user: current_user)
    return curr_vote.vote if curr_vote
    nil
  end

end
