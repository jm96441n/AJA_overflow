class Answer < ActiveRecord::Base
  has_many :comments, as: :commentable
  has_many :favorites, as: :favoritable
  has_many :votes, as: :votable
  belongs_to :user
  belongs_to :question

  validates :answer_text, :user, :question, presence: true
end
