get '/' do
  if session[:user_id]
    @user = User.find_by_id(session[:user_id])
    erb :"users/show"
  else
    erb :index
  end
end
