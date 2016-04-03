class Answer < ActiveRecord::Base
  has_many :comments, as: :commentable
  has_many :favorites, as: :favoritable
  has_many :votes, as: :votable
  belongs_to :user
  belongs_to :question

  validates :answer_text, :user, :question, presence: true

  def self.author?(answer_id, user_id)
    answer = Answer.find_by(id: answer_id)
    answer.user_id == user_id
  end

end
