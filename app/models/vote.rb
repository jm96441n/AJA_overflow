class Vote < ActiveRecord::Base
  belongs_to :votable, polymorphic: true
  belongs_to :user

  validates :votable_id, :votable_type, presence: true

  def self.up_votes(id,type)
    Vote.where(up_or_down: "up").where(votable_id: id).where(votable_type: type).size
  end

  def self.down_votes(id,type)
    Vote.where(up_or_down: "down").where(votable_id: id).where(votable_type: type).size
  end

  def self.composite_votes(id,type)
    self.up_votes(id,type) - self.down_votes(id,type)
  end

end
