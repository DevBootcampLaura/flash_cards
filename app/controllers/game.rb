require 'pry'

get "/new" do
  erb :new
end

get '/game/:deck_name' do
  user_id = session[:id]
  @deck = Deck.find_by_name(params[:deck_name])
  name = User.find(user_id).name
  @round = Round.create(:user_id => user_id, :deck_id => @deck.id, :name => "#{name} #{Time.now} ")
  erb :game
end

post '/start' do
  deck = Deck.find_by_name(params[:name]).cards
  cards = []
  deck.all.each do |card|
    cards << card.id
  end

  @c = cards.sample
  redirect "card/#{@c}"
end

get '/card/:card_id' do
  # @deck = Deck.find_by_name(params[:deck_name])
  # @card = @deck.cards.find_by_id(params[:card_id].to_i)
  @card = Card.find(params[:card_id].to_i)
  erb :card
end



post '/card' do
  @card = Card.find(params[:id].to_i)
  @deck = Deck.find_by_name(params[:name])
  if params[:guess] == @card.answer
    @guess = "Correct!"
  else
    @guess = "Incorrect!"
  end
  erb :card
end

post '/next' do
  redirect "game/#{params[:name]}/#{params[:id]+1}"
end



# get '/game/:deck_name/:card_id' do
#   @deck = Deck.find_by_name(params[:deck_name])
#   @card = @deck.cards.find_by_id(params[:card_id].to_i)
#   erb :card
# end
