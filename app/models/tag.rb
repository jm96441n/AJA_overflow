class Tag < ActiveRecord::Base
  has_many :tag_questions
  has_many :questions, through: :tag_questions #check name

  validates :tag_name, presence: true, uniqueness: true
end
