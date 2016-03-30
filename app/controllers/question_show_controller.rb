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
        binding.pry
        added_vote = Vote.new({votable_id: @question.id, votable_type: "Question", user: current_user})
        if added_vote.save
          content_type :json
          {votes: question.vote_count, id: params[:id]}.to_json
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

