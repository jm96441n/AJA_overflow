class Favorite < ActiveRecord::Base
  belongs_to :favoritable, polymorphic: true
  belongs_to :user

  validates :favoritable_id, :favoritable_type, presence: true

  def self.favorite_total(id,type)
    Favorite.where("favoritable_id = ? AND favoritable_type = ?", id, type).size
  end

end
