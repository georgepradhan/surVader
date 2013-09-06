before '/surveys/new' do
  unless logged_in?
    redirect to('/')
  end
end

get '/surveys/new' do

  erb :survey_create
end

post '/surveys/new' do
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

post '/questions/new' do
  @survey = Survey.find(params[:survey_id])
  @question = Question.create(label: params[:label], survey: @survey)
  erb :_choice_create, layout: false
end
 
post '/choices/new' do
  @survey = Survey.find(params[:survey_id])
  @question = Question.find(params[:question_id])
  @choice = Choice.create(label: params[:label], question: @question)
  erb :_choice_create, layout: false
end

