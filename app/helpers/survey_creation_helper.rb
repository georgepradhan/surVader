helpers do

  def save_survey
    @new_survey = Survey.create(label: params[:label], description: params[:description], user: current_user)
    params.delete("label")
    params.delete("description")
    params.each_value do |question_hash|
      @new_question = Question.create(label: question_hash[:label], survey: @new_survey)
      question_hash.delete("label")
      question_hash.each_value do |choice_description|
        Choice.create(label: choice_description, question: @new_question)
      end
    end
  end

end
