get '/' do
  redirect '/index'
end

get '/index' do 
  @questions = Question.all

  erb :'/questions/index'
end





