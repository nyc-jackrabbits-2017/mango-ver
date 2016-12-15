get '/login' do
erb :login
end

post '/login' do

  @user = User.find_by(username: params[:username])

    if @user && @user.authenticate(params[:password])
    session[:user_id] = @user.id
    redirect "/"
  else
    @errors = 'Invalid Username or Password'
    erb :login
  end
end

get '/new' do
erb :'users/new'
end


post '/users' do
  @new_user = User.new(params[:user])
    if @new_user.save
      session[:user_id] = @new_user.id
      redirect "/"
    else
      @errors =  @new_user.errors.full_messages
    erb :'user/new'
    end
end


get '/logout' do
  session.clear
  redirect '/'
end
