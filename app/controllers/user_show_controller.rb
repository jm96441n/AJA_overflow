get "/users/new" do
	erb :'/users/new'
end

post '/users' do

	user = User.new(params[:user])

	user.save
	if user.save
		session[:user_id] = user.id
		redirect "/users/#{session[:user_id]}"
	else
		@errors = user.errors.full_messages
		erb :'/users/new'
	end
end
# view profile

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

get "/users/:id" do
  @user = User.find_by(id: params[:id])
  erb :'users/show'
end