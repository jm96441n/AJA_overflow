get '/login' do	
	if request.xhr? 
    erb :'/sessions/_new', {layout: false}
  else
    erb :'/sessions/new'
  end
end

post '/login' do
	user  = User.find_by(username: params[:user][:username])
	if user && user.authenticate(params[:user][:password])
		if request.xhr?
			session[:user_id] = user.id
			content_type :json
      {username: params[:user][:username], password: params[:user][:password]}.to_json
		else
			session[:user_id] = user.id
			redirect '/'
		end

	else
		@errors = ['Wrong username or password, try again']
		erb :'sessions/new'
	end

end

get '/logout' do
	session.clear
	redirect '/'
end

##to do 

# #new question form still shows when you arent logged in
# if request.xhr?
#     @task.assign_attributes(name: params[:name], note: params[:note], list_id: params[:id])
    
#     if @task.save
#       # redirect "/users/#{session[:logged_in_id]}"
#       content_type :json
#       {name: params[:name], note: params[:note]}.to_json
#     else
#       @errors = @task.errors.full_messages
#       erb :'/tasks/_edit'
#     end 