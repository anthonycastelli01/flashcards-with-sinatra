post '/decks/:deck_id/cards' do
  user = User.find_by_id(session[:user_id])
  deck = Deck.find_by_id(params[:deck_id] )
  card = Card.new(term: params[:term], definition: params[:definition])

  deck.cards << card

  puts "=" * 60
  puts "THIS IS THE DEFINITION #{card.definition}"

  if card.save
    redirect "/decks/#{deck.id}"
  else
    redirect "/decks/#{deck.id}"
  end
end