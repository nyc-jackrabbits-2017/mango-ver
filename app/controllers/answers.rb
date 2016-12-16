
get '/questions/:id/answers/new' do
  @question = Question.find(params[:id])
  erb :'answer/new'
end

post '/questions/:id/answers' do
  redirect '/login' unless logged_in?
  @question = Question.find_by(id: params[:id])
  @answer = @question.answers.new(description: params[:description], user_id: current_user.id)
  if @answer.save
      redirect "/questions/#{@question.id}"
  else
      @errors = @answer.errors.full_messages
      erb :'answer/new'
  end
end

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
#add vote sum method


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
      redirect "/questions/#{@answer.question_id}" # this should be redirected back to question
    else
      @errors = @answer.errors.full_messages
      erb :'answer/edit'
    end

end

get '/answers/:id/delete' do
  @answer = Answer.find(params[:id])
    @answer.destroy
    redirect "/questions/#{@answer.question_id}"
end
