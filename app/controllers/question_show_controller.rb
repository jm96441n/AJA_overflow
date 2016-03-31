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
          composite_votes = Vote.composite_votes(@question.id, down_vote.votable_type)
          content_type :json
          {down_votes: down_vote_count, composite_votes: composite_votes}.to_json
        else
          status 400
        end
      when "favorite"
        favorite = Favorite.new({favoritable_id: @question.id, favoritable_type: "Question", user: current_user})
        if favorite.save
          favorite_count = Favorite.favorite_total(@question.id, favorite.favoritable_type)
          content_type :json
          {favorite_count: favorite_count}.to_json
        else
          status 400
        end
      when "edit"
        if current_user && Question.author?(@question.id, current_user.id)
          #insert logic for editing question here
        else
          #raise error message - this person is not allowed to edit a question
        end
    end
  else
    erb :'questions/edit'
  end
end

