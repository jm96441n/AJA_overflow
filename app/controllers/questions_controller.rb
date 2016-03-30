get '/' do
  redirect '/index'
end

get '/index' do 
  @questions = Question.all

  erb :'/questions/index'
end

post '/questions/new' do
  @question.new(question_text: params[:question_text], user_id: session[:logged_in_id])

  if @question.save
    redirect '/index'
  else
    @question.errors.full_messages
  end
end



