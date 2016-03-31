class Vote < ActiveRecord::Base
  belongs_to :votable, polymorphic: true
  belongs_to :user

  validates :votable_id, :votable_type, presence: true

  def self.up_votes(id,type)
    up_votes = Vote.where(up_or_down: "up").where(votable_id: id).where(votable_type: type)
    up_votes.size
  end

end
