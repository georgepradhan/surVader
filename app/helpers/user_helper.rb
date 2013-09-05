helpers do

  def current_user
    @user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user
  end

  def signup
    user = User.new(username: params[:username], password: params[:password])
    if user.save
      redirect "/"
    else
      "Deal with errors..."
    end
  end

end

