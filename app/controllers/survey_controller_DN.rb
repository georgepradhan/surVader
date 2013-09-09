before '/surveys/new' do
  unless logged_in?
    redirect to('/')
  end
end

get '/surveys/new' do

  erb :survey_create
end

post '/surveys/new' do
  save_survey
  redirect to('/')
end

post '/questions/new' do
  @question_index = params[:question_index]
  erb :_question_create, layout: false
end
 
post '/choices/new' do
  @question_index = params[:question_index]
  @choice_index = params[:choice_index]
  erb :_choice_create, layout: false
end
