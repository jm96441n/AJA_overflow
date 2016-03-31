get "/users/new" do
  if request.xhr?
    erb :'/users/_new', {layout: false}
  else 
    erb :'/users/new'
  end
end

post '/users' do
	user = User.new(params[:user])

	if user.save
    if request.xhr?
      session[:user_id] = user.id
      content_type :json
      {username: params[:user][:username], password: params[:user][:password]}.to_json

      erb :'/index', {layout: false} 
    else
  		session[:user_id] = user.id
  		redirect "/users/#{session[:user_id]}"
    end
  else
		@errors = user.errors.full_messages
		erb :'/users/new'
	end
end
# view profile

# delete profile (not currently implemented)
get "/users/:id/delete" do
  @user = User.find_by(id: params[:id])
  @user.destroy
  sessions.clear

  erb :'/index'
end

# edit profile (not currently implemented)
# only allow edits if its your own profile
get "/users/:id/edit" do
  @user = User.find_by(id: params[:id])

  if request.xhr?
    if @user.id == session[:user_id]
      erb :'users/_edit', locals: {user: @user}, layout: false
    else
      redirect '/'
    end
  else
    if @user.id == session[:user_id]
      erb :'users/edit'
    else
      redirect '/'
    end
  end
end

put '/users/:id' do
  @user = User.find_by(id: params[:id])
  @user.assign_attributes(params[:user])

  if @user.save
    redirect "/users/#{@user.id}"
  else
    @errors = @user.errors.full_messages

    erb :'/users/show'
  end
end

get "/users/:id" do
  @user = User.find_by(id: params[:id])
  erb :'users/show'
end