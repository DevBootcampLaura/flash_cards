get '/newgame' do
  erb :deck_select
end

get '/deck/:name' do
  session[:round_name] = round_name(params[:name])
  Round.create(user_id: session[:id], deck_id: Deck.where(name: params[:name]).first.id, name: session[:round_name], complete: false)
end

get '/result/:name' do
  @name = params[:name]
  @id = Round.where(name: @name).first.id
  erb :result
end

get '/delete/:round' do
  Round.destroy(params[:round])
  redirect '/'
end
