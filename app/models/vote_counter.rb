module VoteCounter
  def vote_sum
    self.votes.reduce(0) {|sum, vote| sum + vote.vote_value}
  end
end
