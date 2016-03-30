get '/login' do

	erb :'/sessions/new'
end

post '/login' do
	user  = User.find_by(params)

end
