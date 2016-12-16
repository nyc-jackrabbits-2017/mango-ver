get '/votes/new' do
  erb :'votes/_new'
end

post '/votes' do
  @vote = Vote.new(params[:vote])
  @vote.user = current_user
  if @vote.save
    if request.xhr?
      erb :'votes/_new', layout: false, locals: {voteable_object: @vote.voteable}
    else
      redirect request.referer
    end
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
    if request.xhr?
      erb :'votes/_new', layout: false, locals: {voteable_object: @vote.voteable}
    else
      redirect request.referer
    end
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
  if request.xhr?
    erb :'votes/_new', layout: false, locals: {voteable_object: @vote.voteable}
  else
    redirect request.referer
  end
end
