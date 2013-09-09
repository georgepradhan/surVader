# stuff for creating a user
get '/' do
  # Look in app/views/index.erb
  if logged_in?
    redirect "/users/#{current_user.id}"
  else
    erb :index
  end
end

post "/users" do
  signup
end

get "/users/:user_id" do
  @user = User.find(params[:user_id])
  @surveys = @user.surveys
  erb :user_dashboard
end

