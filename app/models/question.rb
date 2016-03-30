class Question < ActiveRecord::Base
  # Remember to create a migration!

  has_many :comments, as: :commentable
  has_many :favorites, as: :favoritable
  has_many :votes, as: :votable
  belongs_to :user
  has_many :tagquestions #check name
  has_many :tags, through: :tagquestions #check name
end
