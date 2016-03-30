class Favorite < ActiveRecord::Base
  belongs_to :favoritable, polymorphic: true
  belongs_to :user

  validates :favoritable_id, :favoritable_type, presence: true
end
