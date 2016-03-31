get '/login' do
	erb :'/sessions/new'
end

post '/login' do
	user  = User.find_by(username: params[:user][:username])
	if request.xhr?
		if user && user.authenticate(params[:user][:password])
			session[:user_id] = user.id
		else
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
	session.clear
	redirect '/'
end

