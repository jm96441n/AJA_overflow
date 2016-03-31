get '/' do
  redirect '/index'
end

get '/index' do 
  @questions = Question.all

  erb :'/questions/index'
end

post '/questions/new' do
  @question.new(question_text: params[:question_text], user_id: session[:user_id])

  if @question.save
    if request.xhr?
      content_type :json
      {question_text: params[:question_text], user_id: session[:user_id]}.to_json

      erb :'/index', {layout: false}
    else
      redirect '/index'
    end
  else
    @question.errors.full_messages
  end
end



