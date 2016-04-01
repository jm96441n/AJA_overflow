post '/answers/new' do
  @question = Question.find_by(id: params[:answer][:question_id])
  @answer = Answer.new(params[:answer])

  if @answer.save
    erb :"/answers/_single_answer", locals: {answer: @answer}, layout: false
  else
    status 400
  end
end
