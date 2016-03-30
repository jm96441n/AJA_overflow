class Tag < ActiveRecord::Base
  # Remember to create a migration!
  has_many :tag_questions
  has_many :questions, through: :tag_questions #check name

end
