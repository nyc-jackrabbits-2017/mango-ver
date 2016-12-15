class Vote < ActiveRecord::Base
  validates_presence_of :voteable_type, :voteable_id, :user_id, :vote_value
  validates_uniqueness_of :user_id, scope: [:voteable_type, :voteable_id]

  belongs_to :user
  belongs_to :answer, polymorphic: true
  belongs_to :question, polymorphic: true
end
