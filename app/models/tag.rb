class Tag < ActiveRecord::Base
  # Remember to create a migration!
  has_many :tagquestions
  has_many :questions, through: :tagquestions #check name

end
