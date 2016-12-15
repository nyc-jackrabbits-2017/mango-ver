class Votes < ActiveRecord::Base
  validates_presence_of :votable_type, :votable_id, :user_id, :vote_value
  validates_uniqueness_of :votable_type, :votable_id, :user_id
end
