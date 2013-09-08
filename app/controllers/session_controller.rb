before do
  erb :index unless logged_in?
end

post '/login' do
  login
end

get '/logout' do
  logout
end
