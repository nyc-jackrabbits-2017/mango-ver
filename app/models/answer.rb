class Answer < ActiveRecord::Base
  validates :description, :user_id, :question_id, presence: true

  belongs_to :user
  belongs_to :question
  has_many :votes, as: :voteable
  has_many :comments, as: :commentable

  include VoteCounter

  before_save :only_one_best_answer

  def only_one_best_answer
    return true if self.answer_chosen == false
    answers_for_this_question = self.question.answers
    answers_chosen = answers_for_this_question.select {|answer| answer.answer_chosen}
    if answers_chosen.length == 0
      return true
    else
      self.errors.add(:answer_chosen, 'You already picked best answer!')
      return false
    end
  end

end
