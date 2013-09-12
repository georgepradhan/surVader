
post '/login' do
  login
end

get '/logout' do
  if current_user
    logout
  end
end
