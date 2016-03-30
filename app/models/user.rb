class User < ActiveRecord::Base
  # Remember to create a migration!
  has_secure_password

  has_many :comments
  has_many :questions
  has_many :favorites
  has_many :votes


end
