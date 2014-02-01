get '/round/:name' do
  @round = Round.where(name: params[:name]).first
  erb :round
end
