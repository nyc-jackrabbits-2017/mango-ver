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
    sorted_answers = self.answers.sort_by {|answer| answer.vote_sum}
    answer_chosen_index = sorted_answers.index {|answer| answer.answer_chosen}
    sorted_answers.unshift(sorted_answers.delete_at(answer_chosen_index)) if answer_chosen_index
    return sorted_answers
  end

end
