 # put in the route to show a specific question
 #
 # @answers = Answer.where(question_id:params[id])

post '/answers/:id/upvote' do
  answer = Answer.find(params[:id])
  # if the vote for answer is already assigned delete the vote
  if answer.vote != nil
    answer.votes.create(value: 1)
  else
    #need to send to be deleted or delete here
  end
  redirect “/questions”
end


post '/answers/:id/downvote' do
  answer = Answer.find(params[:id])
  # if the vote for answer is already assigned delete the vote
  if answer.vote != nil
    answer.votes.create(value: -1)
  else
    #need to send to be deleted or delete here
  end
  redirect “/questions”
end


get '/answers/:id/edit' do
  @answer = Answer.find(params[:id])
  erb :'answer/edit'
end


put '/answers/:id' do
  @answer = Answer.find(params[:id])
  @answer.assign_attributes(description: params[:description])
    if @answer.save
      redirect "/" # this should be redirected back to question
    else
      @errors = @answer.errors.full_messages
      erb :'answer/edit'
    end

end

get '/answers/:id/delete' do
  @answer = Answer.find(params[:id])
    @answer.destroy
    redirect '/'# this should be redirected back to question
end

get '/answers/:id/new' do
  @question = Question.find(params[:id])
  erb :'answer/new'#need to send it to correct place
end


post '/answers/:id/questions' do
  @answer = Answer.new(description: params[:description], question_id: params[:id], user_id: current_user)#need helper method for current user
  if @answer.save
      redirect "/"
    else
      @errors = @entry.errors.full_messages
      erb :'/' #need to send it to correct place
end


end
