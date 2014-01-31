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
  redirect "game/#{params[:name]}/1"
end






get '/game/:deck_name/:card_id' do
  "Hi We reach this page!!!"
end
