get '/post/new' do 
  erb :post_new
end

get '/post/:id' do
  @post = Post.find(params[:id])
  erb :post_show
end


post '/posts' do
  Post.create(params[:post])
  redirect "/"
end

get '/posts/:user_id' do
  @user = User.find(params[:user_id])
  erb :user_submissions
end

