get '/votes/new' do
  erb :'votes/_new'
end

post '/votes' do
  @vote = Vote.new(params[:vote])
  @vote.user = current_user
  if @vote.save
    redirect request.referer
  else
    @errors = @vote.errors.full_messages
    redirect request.referer
  end
end

put '/votes' do
  vote_info = params[:vote]
  vote_info[:user] = current_user
  @vote = Vote.find_by(vote_info)
  @vote.vote_value = params[:vote_value]
  if @vote.save
    redirect request.referer
  else
    @errors = @vote.errors.full_messages
    redirect request.referer
  end
end

delete '/votes' do
  vote_info = params[:vote]
  vote_info[:user] = current_user
  @vote = Vote.find_by(vote_info)
  @vote.destroy if @vote
  redirect request.referer
end
