class User < ActiveRecord::Base

  ROLES = ["Owner", "Moderator"]

  has_secure_password

  has_many :posts
  has_many :comments, through: :posts

end
