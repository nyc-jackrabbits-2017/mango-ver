class Comment < ActiveRecord::Base
  validates :description, :commentable_type, :commentable_id, :user_id, presence: true

  belongs_to :user
  belongs_to :answer, polymorphic: true
  belongs_to :question, polymorphic: true

end
