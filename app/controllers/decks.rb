get '/users/:id/decks/new' do
  @user = User.find_by_id(params[:id])
  erb :new_deck
end

post '/users/:id/decks/create' do
  user = User.find_by_id(params[:id])
  deck = Deck.new( name: params[:name] )

  user.decks << deck

  if deck.save
    redirect "/users/#{user.id}"
  else
    redirect "/users/#{user.id}/decks/new"
  end
end

get '/users/:user_id/decks/:deck_id' do
  @user = User.find_by_id(params[:user_id])
  @deck = Deck.find_by_id(params[:deck_id] )

  erb :deck
end