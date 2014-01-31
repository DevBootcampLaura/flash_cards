post '/login' do
  user = User.find_or_create_by(name: params['username'])
  @user = user.id
  erb :landing
end
