get "/comments/new" do
  @commentable_type = params[:commentable_type]
  @commentable_id = params[:commentable_id]

  if request.xhr?
    erb :"/comments/_new_comments", locals: {commentable_type: @commentable_type, commentable_id: @commentable_id}, layout: false
  else
    erb :"/comments/new"
  end
end

post "/comments/new" do
  @new_comment = Comment.new(params[:comment])

  if params[:comment][:commentable_type] == "Question"
    @question = params[:comment][:commentable_id]
  else
    @answer = Answer.find_by(id: params[:comment][:commentable_id])
    @question = Question.find_by(id: @answer.question_id)
  end
  if @new_comment.save && request.xhr?
    @comment_author = User.find_by(id: @new_comment.user_id)
    erb :"/comments/_show", locals: {comment: @new_comment, author: @comment_author}, layout: false
  elsif @new_comment.save
    @comment_author = User.find_by(id: @new_comment.user_id)
    redirect "/questions/#{@question.id}"
  else
    @errors = ["Unable to save your question we were. Try again you must."]
    erb :"/questions/#{@question.id}"
  end
end