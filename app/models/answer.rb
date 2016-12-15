class Answer < ActiveRecord::Base
  validates :description, :user_id, :question_id, presence: true
end
