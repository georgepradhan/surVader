get '/surveys' do
  @surveys = Survey.all
  erb :_surveys_list
end

get '/surveys/:survey_id' do
  @survey = Survey.find(params[:survey_id])

  erb :_survey_show
end

