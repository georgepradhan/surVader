helpers do

  def current_user
    @user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    true if current_user
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

  def gravatar_image_source
    email = current_user.email
    hash = Digest::MD5.hexdigest(email)
    "http://www.gravatar.com/avatar/#{hash}"
  end

end

