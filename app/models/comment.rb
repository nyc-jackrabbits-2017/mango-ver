class Comment < ActiveRecord::Base
  validates :description, :commentable_type, :commentable_id, :user_id, presence: true
  
end
