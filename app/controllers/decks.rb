get '/decks/new' do
  @user = User.find_by_id(session[:user_id])
  erb :'decks/new'
end

post '/decks' do
  user = User.find_by_id(session[:user_id])
  deck = Deck.new(params)

  user.decks << deck

  if deck.save
    redirect "/"
  else
    erb :'decks/new'
  end
end

get '/decks/:deck_id' do
  @user = User.find_by_id(session[:user_id])
  @deck = Deck.find_by_id(params[:deck_id])

  erb :'decks/index'
end

get '/users/:user_id/edit' do
  @user = User.find_by_id(session[:user_id])

  erb :'users/edit'
end

put '/users/:id' do
  @user = User.find_by_id(session[:user_id])
  @user.update_attributes(
          first_name: params[:first_name],
          last_name: params[:last_name],
          email: params[:email],
          password: params[:password]
        )

  redirect '/'
end