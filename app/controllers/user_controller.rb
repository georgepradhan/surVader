# stuff for creating a user

get "/login" do
  erb :user_signup
end

post "/users" do
  signup
end

get "/user/:user_id" do
  @user = User.find(params[:user_id])
  @surveys = @user.surveys
  erb :user_profile
end

