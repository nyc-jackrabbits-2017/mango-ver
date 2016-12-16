
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

get '/answers/:id/edit' do
  @answer = Answer.find(params[:id])
  erb :'answer/edit'
end


put '/answers/:id' do
  @answer = Answer.find(params[:id])
  @answer.assign_attributes(description: params[:description])
    if @answer.save
      redirect "/questions/#{@answer.question_id}"
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

put '/answer_chosen/:answer_id' do
  answer = Answer.find_by(id: params[:answer_id])
  answer.answer_chosen = params[:answer_chosen] if answer
  if answer.save
    redirect request.referer
  else
    redirect request.referer
  end
end
