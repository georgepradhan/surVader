get '/comments' do 
  @comments = Comment.all
  erb :comments_show
end


get '/comments/:user_id' do
  @user = User.find(params[:user_id])
  erb :user_comments
end

post '/comments' do
  if logged_in?
    post = Post.find(params[:post_id])
    post.comments.create(text: params[:user_comment], user: current_user)
    redirect "post/#{post.id}"
  else
    redirect "/login"
  end
end

