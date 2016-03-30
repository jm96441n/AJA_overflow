class TagQuestion < ActiveRecord::Base
  belongs_to :tag
  belongs_to :question

  validates :question, :tag, presence: true
end
