post '/answers/new' do
  @question = Question.find_by(id: params[:answer][:question_id])
  @answer = Answer.new(params[:answer])

  if @answer.save
    erb :"/answers/_single_answer", locals: {answer: @answer}, layout: false
  else
    status 400
  end
end

get '/answers/:id/edit' do
  @answer = Answer.find_by(id: params[:id])

  if request.xhr?
    case params[:action]
      when "up-vote"
        up_vote = Vote.new({votable_id: @answer.id, votable_type: "Answer", user: current_user, up_or_down: "up"})
        if up_vote.save
          composite_votes = Vote.composite_votes(@answer.id, up_vote.votable_type)
          content_type :json
          {composite_votes: composite_votes}.to_json
        else
          status 400
        end
      when "down-vote"
        down_vote = Vote.new({votable_id: @answer.id, votable_type: "Answer", user: current_user, up_or_down: "down"})
        if down_vote.save
          composite_votes = Vote.composite_votes(@answer.id, down_vote.votable_type)
          content_type :json
          {composite_votes: composite_votes}.to_json
        else
          status 400
        end
      when "edit"
        if current_user #&& Answer.author?(@question.id, current_user.id)
          erb :"/questions/_edit_question", locals: {answer: @answer}, layout: false
        else
          #raise error message - this person is not allowed to edit a question. reload page with error
          redirect "/questions/<%=@question.id%>"
        end
    end
  else
    erb :'answers/edit'
    #right now if the user doesn't send an ajax request, it will automatically load the edit answer page, which is not necessarily what we want, if they are favoriting something or up/down voting something
  end
end
