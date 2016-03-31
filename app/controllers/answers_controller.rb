post '/answers/new' do
  @question = Question.find_by(id: params[:answer][:question_id])
  answer = Answer.new(params[:answer])
  binding.pry
  if answer.save
    #return answer partial
    erb :"/answers/_answers_list", locals: {question: @question}, layout: false
  else
    status 400
  end
end
