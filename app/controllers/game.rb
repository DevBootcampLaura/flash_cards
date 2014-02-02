require 'pry'

get "/new" do
  erb :new
end

post '/start' do
  deck = Deck.find_by_name(params[:name])
  round = Round.create(:user_id => session[:id], :deck_id => deck.id, :name => "#{params[:name]} #{Time.now} ")
  session[:round_id] = round.id
  session[:cards] = []
  deck.cards.all.each do |card|
    session[:cards] << card.id
  end

  @c = session[:cards].shuffle!.pop
  session[:new_guess] = nil
  redirect "card/#{@c}"
end

get '/card/:card_id' do
  @card = Card.find(params[:card_id].to_i)

  if session[:new_guess]  == nil
    @guess = nil
  elsif session[:new_guess] == session[:answer]
    @guess = "Correct!"
  else
    @guess = "Incorrect!"
  end

  erb :card
end

post '/card' do
  @new_guess = Guess.create(card_id: params[:id], round_id: session[:round_id], guess: params[:guess])
  @card = Card.find(params[:id].to_i)

  session[:new_guess] = params[:guess]
  session[:answer] = @card.answer

  "Game end!" if session[:cards] == nil
  until session[:cards].size == 0
    @c = session[:cards].pop
    redirect "card/#{@c}"
  end
  if session[:cards].size == 0
    redirect "/complete"
  end

end

get '/complete' do
  if session[:new_guess]  == nil
    @guess = nil
  elsif session[:new_guess] == session[:answer]
    @guess = "Correct!"
  else
    @guess = "Incorrect!"
  end
  erb :last_card
end






