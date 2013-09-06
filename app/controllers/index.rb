get '/' do
  # Look in app/views/index.erb
  if logged_in?
    redirect "/user/#{current_user.id}"
  else
    erb :index
  end
end
