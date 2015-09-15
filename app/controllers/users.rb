get '/users/new' do
  erb :signup
end

post '/users/create' do
  @user = User.new(params)
  if @user.save
    session[:user_id] = @user.id
    redirect "/users/#{@user.id}"
  else
    redirect "/users/new"
  end
end

get '/users/:id' do
  @user = User.find_by_id(params[:id])
  erb :profile
end

post '/sessions/create' do
  user = User.find_by_email(params[:email])

  if user.nil?
    redirect '/'
  elsif user.password == params[:password]
    session[:user_id] = user.id
    redirect "/users/#{user.id}"
  else
    redirect '/'
  end
end

get '/logout' do
  session[:user_id] = nil
  redirect '/'
end