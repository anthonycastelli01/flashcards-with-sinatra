get '/users/new' do
  erb :'users/new'
end

post '/users' do
  @user = User.new(params)
  if @user.save
    session[:user_id] = @user.id
    redirect "/"
  else
    redirect "/users/new"
  end
end

post '/sessions/create' do
  user = User.find_by_email(params[:email])

  if user.nil?
    redirect '/'
  elsif user.password == params[:password]
    session[:user_id] = user.id
    redirect "/"
  else
    redirect '/'
  end
end

get '/logout' do
  session[:user_id] = nil
  redirect '/'
end