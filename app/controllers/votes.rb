get '/votes/new' do
  erb :'votes/_new'
end

post '/votes' do
  @vote = Vote.new(params[:vote])
  @vote.user = current_user
  if @vote.save
    "Thank you for your vote"
  else
    @errors = @vote.errors.full_messages
    erb :'votes/_new'
  end
end

put '/votes' do
  vote_info = params[:vote]
  vote_info[:user] = current_user
  @vote = Vote.find_by(vote_info)
  @vote.vote_value = params[:vote_value]
  if @vote.save
    "Thank you for your vote"
  else
    @errors = @vote.errors.full_messages
    erb :'votes/_new'
  end
end
