get '/questions' do
  @questions = Question.all
  erb :index
end

get '/questions/:id' do
  @question = Question.find_by(id: params[:id])
  erb :'questions/show'
end

get '/questions/new' do
  erb :'questions/new'
end

post '/questions' do
  user = User.find_by(id: current_user.id)
  @question = user.question.new(params[:question])
  if @question.save
     redirect '/'
  else
    @errors = @question.errors.full_messages
    erb :'questions/new'
  end
end

get '/questions/:id/edit' do
  @question = Question.find_by(id: params[:id])
  erb :'questions/edit'
end

put '/questions/:id' do
  question = Question.find_by(id: params[:id])
  if question.update_attributes(params[:question])
    redirect "/questions/#{question.id}"
  else
    @errors = question.errors.full_messages
  end
end

delete '/questions/:id' do
  question = Question.find_by(id: params[:id])
  question.destroy
  redirct '/'
end
