get '/votes/new' do
  erb :'votes/new'
end

post '/votes' do
  @vote = Vote.new(params[:vote])
  @vote.user = current_user
  if @vote.save
    "Thank you for your vote"
  else
    @errors = @vote.errors.full_messages
    erb :'votes/new'
  end
end

  put '/votes' do
    @vote = Vote.find_by(user: current_user)
    @vote.vote_value = params[:vote][:vote_value]
    if @vote.save
      "Thank you for your vote"
    else
      @errors = @vote.errors.full_messages
      erb :'votes/new'
    end
  end
