def already_voted?(object)
  previous_vote = Vote.find_by(user: current_user, voteable: object)
  if previous_vote
    true
  else
    false
  end
end
