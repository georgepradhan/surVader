# stuff for creating a user

get "/login" do
  erb :user_signup
end

post "/users" do
  signup
end

get "/users/:user_id" do
  @user = User.find(params[:user_id])
  @surveys = @user.surveys
  # erb :user_profile << View used during Friday presentation
  erb :user_dashboard
end

