class Post < ActiveRecord::Base

  has_many :comments, through: :users
  has_many :users

end
