class Answer < ActiveRecord::Base
  validates :description, :user_id, :question_id, presence: true

  belongs_to :user
  belongs_to :question
  has_many :votes, as: :voteable
  has_many :comments, as: :commentable

  include VoteCounter
end
