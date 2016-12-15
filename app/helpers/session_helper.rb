def logged_in?
  !!session[:user_id]
end

def current_user
  @current_user ||=User.find_by(id: session[:user_id])
end

def authorized?(object)
  @current_user ||=User.find_by(id: session[:user_id])
  return false unless @current_user
  if @current_user.id  == object.user_id
    return true
  else
    return false
  end

end
