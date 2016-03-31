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
		session[:user_id] = user.id
		redirect '/'
	else
		@errors = ['Wrong username or password, try again']
		erb :'sessions/new'
	end

end

get '/logout' do
	session.clear
	redirect '/'
end

