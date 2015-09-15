post '/users/:user_id/decks/:deck_id/cards/create' do
  user = User.find_by_id(params[:user_id])
  deck = Deck.find_by_id(params[:deck_id] )
  card = Card.new(term: params[:term], definition: params[:definition])

  deck.cards << card

  puts "=" * 60
  puts "THIS IS THE DEFINITION #{card.definition}"

  if card.save
    redirect "/users/#{user.id}/decks/#{deck.id}"
  else
    redirect "/users/#{user.id}/decks/#{deck.id}"
  end
end