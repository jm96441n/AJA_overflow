
get '/tags/index' do
  @tags = Tag.all
  erb :'/tags/index'
end

get '/tags/new' do

end

get '/tags/:id' do
  @tag = Tag.find_by(id: params[:id])
  @questions = @tag.questions
  erb :'/tags/show'
end
