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

post '/questions/new' do # I get that these (15-24) are POST routes because of the AJAX calls and the dynamic naming of the input fields, and it works, but try to think of different ways of doing this that allows them to be GET routes, since *really* all these routes do is fetch a partial
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
  puts @choices
  if request.xhr?
    erb :_results_small, layout: false
  else
    erb :_results
  end
end

# AJAX controller for survey_results.js
get "/surveys/:survey_id/results/questions/:question_id" do
  content_type :json
  @choices = []
  @question = Question.find(params[:question_id])

  @question.choices.each do |choice|
    @choices << {label: "#{choice.label}", value: "#{choice.responses.count}"}
  end

  @choices.to_json
end
# ^ why are all these (44-54) instance variables?



