class Question < ActiveRecord::Base
  # Remember to create a migration!
  validates :title, :user_id, presence: true
  validates_uniqueness_of :title

  belongs_to :user
  has_many :answers
  has_many :comments, as: :commentable
  has_many :votes, as: :voteable

  include VoteCounter

  def sorted_answers
    sorted_answers = self.answers.sort_by! {|answer| answer.vote_sum}
    sorted_answers.unshift!(sorted_answers.delete_if { |answer| answer.answer_chosen }.first)
  end
end
