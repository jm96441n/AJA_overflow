post '/questions/new' do
  @question = Question.new(question_text: params[:question_text], user_id: session[:user_id])

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

#question show page route
get '/questions/:id' do
  @question = Question.find_by(id: params[:id])
  @asker = User.find_by(id: @question.user_id)
  erb :'questions/show'
end

#delete question route
delete '/questions/:id' do
  @question = Question.find_by(id: params[:id])
  @question.destroy
  redirect '/'
end

#edit question route
get '/questions/:id/edit' do

  @question = Question.find_by(id: params[:id])
  @asker = User.find_by(id: @question.user_id)

  if request.xhr?

    case params[:action]
      when "up-vote"
        added_vote = Vote.new({votable_id: @question.id, votable_type: "Question", user: current_user})
        if added_vote.save
          content_type :json
          {votes: @question.vote_count.to_s}.to_json
        else
          status 400
        end
      when "down-vote"
      when "favorite"
      when "edit"
    end
  else
    erb :'questions/edit'
  end
end

