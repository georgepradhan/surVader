before do
  erb :index unless logged_in?	#instead of checking for logged_in?, just check for current_user
end

post '/login' do
  login
end

get '/logout' do
  logout
end
