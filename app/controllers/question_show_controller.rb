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
        up_vote = Vote.new({votable_id: @question.id, votable_type: "Question", user: current_user, up_or_down: "up"})
        if up_vote.save
          up_vote_count = Vote.up_votes(@question.id, up_vote.votable_type)
          composite_votes = Vote.composite_votes(@question.id, up_vote.votable_type)
          content_type :json
          {up_votes: up_vote_count, composite_votes: composite_votes}.to_json
        else
          status 400
        end
      when "down-vote"
        down_vote = Vote.new({votable_id: @question.id, votable_type: "Question", user: current_user, up_or_down: "down"})
        if down_vote.save
          down_vote_count = Vote.down_votes(@question.id, down_vote.votable_type)
          composite_votes = Vote.composite_votes(@question.id, up_vote.votable_type)
          binding.pry
          content_type :json
          {down_votes: down_vote_count, composite_votes: composite_votes}.to_json
        else
          status 400
        end
      when "favorite"
      when "edit"
    end
  else
    erb :'questions/edit'
  end
end

