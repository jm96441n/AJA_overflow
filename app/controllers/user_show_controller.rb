# view profile
get "/users/:id" do
  @user = User.find_by(id: params[:id])
  erb :'users/show'
end

# delete profile (not currently implemented)
delete "/users/:id" do
  @user = User.find_by(id: params[:id])
  @user.destroy
  sessions.clear
  redirect '/'
end

# edit profile (not currently implemented)
# only allow edits if its your own profile
get "/users/:id/edit" do
  @user = User.find_by(id: params[:id])
  erb :'users/edit'
end