helpers do

  def current_user
    @user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user
  end

  def signup
    user = User.new(email: params[:email], password: params[:password], name: params[:name])
    if user.save
      session[:user_id] = user.id
      redirect "/"
    else
      "Deal with errors..."
    end
  end

end

