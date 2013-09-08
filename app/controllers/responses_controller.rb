post '/surveys/:survey_id/responses' do
  survey_id = params[:survey_id]
  create_taker
  create_responses
  redirect "/surveys/#{survey_id}/results"
end

