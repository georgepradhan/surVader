post '/survey/:survey_id/responses' do
  survey_id = params[:survey_id]
  create_taker
  create_responses
  redirect "/survey/#{survey_id}/results"
end

get "/survey/:survey_id/results" do
  @survey = Survey.find(params[:survey_id])
  @questions = @survey.questions
  @choices = @questions.map {|question| question.choices}  # array of choice-object arrays... 

  erb :_results
end


