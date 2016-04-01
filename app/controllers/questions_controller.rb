get '/' do
  # redirect '/index'
  erb :index
end

get '/index' do

  @questions = Question.all

  erb :'/questions/index'
end





