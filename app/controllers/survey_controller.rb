get '/surveys' do
  @surveys = Survey.all
  erb :_surveys_list
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

get '/surveys/:survey_id' do
  @survey = Survey.find(params[:survey_id])
  erb :_survey_show
end

get "/surveys/:survey_id/results" do
  @survey = Survey.find(params[:survey_id])
  @questions = @survey.questions
  @choices = @questions.map {|question| question.choices}  # array of choice-object arrays... 
  erb :_results
end
