class Comment < ActiveRecord::Base
  belongs_to :commentable, polymorphic: true
  belongs_to :user

  validates :comment_text, :commentable_id, :commentable_type, presence: true
end

