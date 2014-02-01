get '/create_user' do 
  erb :create_user
end

post '/create_user' do 
  if create_user(params) == 'name'
    @error = 'name'
    erb :error_signup
  elsif create_user(params) == 'length'
    @error = 'length'
    erb :error_signup
  elsif create_user(params) == 'number'
    @error = 'number'
    erb :error_signup
  else
    erb :create_success
  end
end

post '/login' do 
  if login_valid?(params['name'], params['password'])
    session[:id] = User.where(name: params['name']).first.id
    erb :landing
  else
    erb :error_login
  end
end

