helpers do

  def create_taker
    taker = Taker.new(user: current_user, survey: Survey.find(params[:survey_id]))
    "Deal with errors" unless taker.save
  end

  def create_responses
    params[:question].each do |question, choice_id|
      Response.create(choice_id: choice_id, user: current_user)
    end
  end


end

