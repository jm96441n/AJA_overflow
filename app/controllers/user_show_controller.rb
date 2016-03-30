# view profile
get "/users/:id" do
  @user = User.find_by(id: params[:id])
  erb :'users/show'
end

# delete profile (not currently implemented)
delete "/users/:id" do
  #server request to delete user
  #clear sessions
  #back to homepage
  redirect '/'
end

# edit profile (not currently implemented)
get "/users/:id/edit" do
  @user = User.find_by(id: params[:id])
  erb :'users/edit'
end