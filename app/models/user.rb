class User < ActiveRecord::Base
  has_secure_password

  has_many :comments
  has_many :questions
  has_many :favorites
  has_many :answers
  has_many :votes

  validates :recovery_first_pet, :recovery_first_street, :recovery_mom_maiden_name, :last_name, :first_name, :password_digest, presence: true
  validates :username, :email, uniqueness: true, presence: true


  def find_by(user_id)
    User.find_by(id: user_id)
  end
end
