get '/surveys' do
  @surveys = Survey.all
  erb :_surveys_show
end

get '/survey/:survey_id' do
  survey_id = params[:survey_id]
end

