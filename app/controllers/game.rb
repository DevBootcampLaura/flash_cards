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

#When we choose the deck
post '/start' do
  deck = Deck.find_by_name(params[:name]).cards
  session[:cards] = []
  deck.all.each do |card|
    session[:cards] << card.id
  end

  @c = session[:cards].shuffle!.pop
  redirect "card/#{@c}"
end

get '/card/:card_id' do
  @card = Card.find(params[:card_id].to_i)
  erb :card
end

post '/card' do
  @card = Card.find(params[:id].to_i)
  if params[:guess] == @card.answer
    @guess = "Correct!"
  else
    @guess = "Incorrect!"
  end
  erb :card
end

post '/next' do
  while session[:cards] != []
    puts session[:cards].size
    @c = session[:cards].pop
    redirect "card/#{@c}"
  end
  erb :end
end




