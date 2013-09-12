get '/' do
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
  @surveys = @user.surveys #can be refactored into line 16 using the :include option
  erb :user_dashboard
end
