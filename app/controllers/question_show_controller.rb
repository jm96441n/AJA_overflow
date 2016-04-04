get '/questions/new' do
  @tags = Tag.all

  if request.xhr?
    erb :"/questions/_new_question", layout: false
  else
    erb :"/questions/new"
  end
end

get '/questions/index' do
  @questions = Question.order("created_at DESC")

  if request.xhr?
    erb :"/questions/_index", locals: {questions: @questions}, layout: false
  else
    erb :"/questions/index", locals: {questions: @questions}, layout: false
  end
end

get '/questions/add_tags' do
  @tags = Tag.all
  erb :'/questions/add_tags'
end

post '/questions/new' do
  @question = Question.new(question_text: params[:question_text], user_id: session[:user_id])
  @tags = Tag.all
  if @question.save
    if request.xhr?
      session[:quest_id] = @question.id
      content_type :json
      {question_text: params[:question_text], user_id: session[:user_id]}.to_json
      erb :'/questions/add_tags'
    else
      redirect '/questions/add_tags'
    end
  else
    @question.errors.full_messages
  end
end

#question show page route
get '/questions/:id' do
  @question = Question.find_by(id: params[:id])
  @asker = User.find_by(id: @question.user_id)
  @up_votes = Vote.up_votes(@question.id, "Question")
  @down_votes = Vote.down_votes(@question.id, "Question")
  @comp_votes = Vote.composite_votes(@question.id, "Question")
  @favorites = Favorite.favorite_total(@question.id, "Question")
  @answers = @question.answers
  @tags = @question.tags
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
        if current_user #&& Question.author?(@question.id, current_user.id)
          erb :"/questions/_edit_question", locals: {question: @question}, layout: false
        else
          #raise error message - this person is not allowed to edit a question. reload page with error
          redirect "/questions/<%=@question.id%>"
        end
    end
  else
    erb :'questions/edit'
    #right now if the user doesn't send an ajax request, it will automatically load the edit quesiton page, which is not necessarily what we want, if they are favoriting something or up/down voting something
  end
end

#after user clicks to submit edits to question
post '/questions/:id/edit' do
  @question = Question.find_by(id: params[:question_id])
  @question.update(question_text: params[:question_text])

  if @question.save
    redirect "/questions/#{@question.id}"
  else
    status 400
  end
end

