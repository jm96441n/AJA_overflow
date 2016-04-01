class Question < ActiveRecord::Base
  has_many :comments, as: :commentable
  has_many :favorites, as: :favoritable
  has_many :votes, as: :votable
  belongs_to :user
  has_many :tag_questions
  has_many :tags, through: :tag_questions
  has_many :answers

  validates :question_text, :user, presence: true

  def vote_count
    self.votes.size
  end

  def self.author?(question_id, user_id)
    question = Question.find_by(id: question_id)
    question.user_id == user_id
  end

  def ans_count
    self.answers.size
  end

  # def view_count
  #   (0..50).rand
  # end

end
