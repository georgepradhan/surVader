get '/surveys' do
  @surveys = Survey.all
  erb :_surveys_list
end

get '/surveys/new' do
  erb :survey_create
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
  erb :_results
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

post '/surveys' do
  @survey = Survey.new(label: params[:label], description: params[:description], user: current_user)
  if @survey.save
    @confirmation = "You made the survey #{@survey.label}!"
    # redirect to("/users/#{current_user.id}")
    erb :_question_create, layout: false
  else
    @errors = @survey.errors.full_messages
    erb :survey_create
  end
end

post '/questions' do
  @survey = Survey.find(params[:survey_id])
  @question = Question.create(label: params[:label], survey: @survey)
  erb :_choice_create, layout: false
end
 
post '/choices' do
  @survey = Survey.find(params[:survey_id])
  @question = Question.find(params[:question_id])
  @choice = Choice.create(label: params[:label], question: @question)
  erb :_choice_create, layout: false
end
