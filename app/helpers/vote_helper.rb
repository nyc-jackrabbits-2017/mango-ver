def already_voted?(object)
  previous_vote = Vote.find_by(user: current_user, voteable_type: object.class, voteable_id: object.id)
  if previous_vote
    true
  else
    false
  end
end
