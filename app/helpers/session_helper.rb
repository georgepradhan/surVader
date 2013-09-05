helpers do

  def login
    @user = User.find_by_username(params[:username])
    if @user.password == params[:password]
      session[:user_id] = @user.id
      redirect "/"
    else
      erb :auth_errors
    end
  end

  def logout
    session.clear
    redirect "/"
  end

end

