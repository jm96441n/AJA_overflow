class Question < ActiveRecord::Base
  # Remember to create a migration!

  has_many :comments, as: :commentable
  has_many :favorites, as: :favoritable
  has_many :votes, as: :votable
  belongs_to :user
  has_many :tag_questions #check name
  has_many :tags, through: :tag_questions #check name
end
