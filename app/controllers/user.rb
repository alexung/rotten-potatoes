enable :sessions

before '/:username/landing_page' do
	@user = User.find_by(username: params[:username])
	session[:user_id] == @user.id ? @valid = true : @valid = false
end

get '/' do
	erb :index
end

get '/user' do
	erb :'users/create_user'
end

post '/user' do
	user = User.new(params[:user])
	if user.valid?
		user.save
		redirect '/session'
	else
		redirect '/user'
	end
end

get '/session' do
	erb :'users/form'
end

post '/session' do
	user = User.authenticate(params[:username], params[:password])

	if user == nil || user == false
		session[:error] = "Login Failed"
		redirect "/session"
	else
		session[:user_id] = user.id
		redirect "/user/#{current_user.id}"
	end
end

get '/user/:user_id' do
	@movies = Movie.all
	erb :'/users/landing_page'
end

delete '/session' do
	session.clear
	erb :index
end

get '/logout' do
	session.clear
	redirect '/'
end