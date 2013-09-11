helpers do

  def current_user
    @user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    true if current_user
  end
  # ^ this is redundant, remove

  def signup
    user = User.new(email: params[:email], password: params[:password], name: params[:name]) #if you set up the input field names correctly, you can just pass in the params (e.g. params[:user], depending on how you set things)
    if user.save
      session[:user_id] = user.id
      redirect "/"
    else
      "Deal with errors..."
      # reload the erb with the signup form and display errors so user can try again
      # also think about client-side validations (JS) to reduce odds of even hitting this point in the code
    end
  end

  def gravatar_image_source
    email = current_user.email
    hash = Digest::MD5.hexdigest(email)
    "http://www.gravatar.com/avatar/#{hash}"
  end

end

