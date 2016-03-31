class Vote < ActiveRecord::Base
  belongs_to :votable, polymorphic: true
  belongs_to :user

  validates :votable_id, :votable_type, presence: true

  def self.up_votes(id,type)
    Vote.where("up_or_down = ? AND votable_id = ? AND votable_type = ?", "up", id, type).size
  end

  def self.down_votes(id,type)
    Vote.where("up_or_down = ? AND votable_id = ? AND votable_type = ?", "down", id, type).size
  end

  def self.composite_votes(id,type)
    Vote.up_votes(id,type) - Vote.down_votes(id,type)
  end

end
