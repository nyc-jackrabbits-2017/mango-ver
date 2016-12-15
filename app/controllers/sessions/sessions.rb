get '/login' do
erb :login
end

post '/login' do
erb :index
end

get '/new' do
erb :'/user/new'
end

post '/users' do
  @new_user = User.new (params[:user])
    if @new_user.save
      erb :index
    end
end
