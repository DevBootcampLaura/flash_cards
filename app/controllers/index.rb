get '/' do
  if session[:id] == nil
    erb :index
  else
    erb :landing
  end
end

get '/home' do 
  if session[:id] == nil
    redirect '/'
  else
    erb :landing
  end
end

get '/logout' do
  session.clear
  redirect '/'
end