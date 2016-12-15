class Question < ActiveRecord::Base
  # Remember to create a migration!
  validates :title, :user_id, presence: true
  validates_uniqueness_of :title


end
