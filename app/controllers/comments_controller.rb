get "/comments/new" do
  binding.pry
  @commentable_type = params[:commentable_type]
  @commentable_id = params[:commentable_id]
  if request.xhr?
    erb :"/comments/_new_comments", locals: {commentable_type: @commentable_type, commentable_id: @commentable_id}, layout: false
  else
    erb :"/comments/new"
  end
end

post "/comments/new" do
  binding.pry

end