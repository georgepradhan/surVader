before '/surveys/new' do
  unless logged_in?
    redirect to('/')
  end
end

get '/surveys/new' do

  erb :survey_create
end

post '/surveys/new' do
  @new_survey = Survey.new(label: params[:label], description: params[:description], user: current_user)
  if @new_survey.save
    @confirmation = "You made the survey #{@new_survey.label}!"    
    redirect to("/user/#{current_user.id}")
  else
    @errors = @new_survey.errors.full_messages
    erb :survey_create
  end
end
