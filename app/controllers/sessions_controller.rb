 get '/login' do
	if request.xhr? 
    erb :'/sessions/_new', {layout: false}
  else
    erb :'/sessions/new'
  end

end

post '/login' do
	user  = User.find_by(username: params[:user][:username])

	if request.xhr?
		if user && user.authenticate(params[:user][:password])
			session[:user_id] = user.id
			status 200

		else
			status 442
			@errors = ['A correct username of password, enter your must']
		end

	else
		if user && user.authenticate(params[:user][:password])
			session[:user_id] = user.id
			redirect '/'
		else
			@errors = ['A correct username of password, enter your must']
			erb :'sessions/new'
		end
	end
end

get '/logout' do
	if request.xhr?
		session.clear
	else
		session.clear
		redirect '/'
	end
end

