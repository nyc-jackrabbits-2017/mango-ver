def already_voted?
  previous_vote = Vote.find_by(user: current_user)
  if previous_vote
    true
  else
    false
  end
end
