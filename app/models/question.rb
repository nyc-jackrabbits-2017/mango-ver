class Question < ActiveRecord::Base
  # Remember to create a migration!
  validates :title, :user_id, presence: true
  validates_uniqueness_of :title

  belongs_to :user
  has_many :answers
  has_many :comments, as: :commentable
  has_many :votes, as: :voteable



end
