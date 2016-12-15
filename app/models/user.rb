class User < ActiveRecord::Base
  # Remember to create a migration!
  validates :username, :password, presence: true
  validates :username, uniqueness: true
  validates :password, length: {minimum: 5}
  has_many :questions
  has_many :answers
  has_many :votes, as: :voteable
  has_many :comments, as: :commentable

  has_secure_password
end
