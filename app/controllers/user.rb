post '/login' do
  user = User.find_or_create_by(name: params['username'])
  session[:id] = user.id
  erb :landing
end
