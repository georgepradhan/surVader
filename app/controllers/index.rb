get '/' do
  # Look in app/views/index.erb
  if logged_in?
    redirect "/users/#{current_user.id}"
  else
    erb :index
  end
end
