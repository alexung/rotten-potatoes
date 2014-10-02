get '/movie/:id' do
	@movie = Movie.find(params[:id])
	@user = User.find(session[:user_id]) #@user had to be in the get route
	erb :movie
end

post '/movie/:id' do
	@user = User.find(session[:user_id])
	@movie = Movie.find(params[:id])

	@comment = Comment.create(user: @user, movie: @movie, text: params[:text])

	# p @user
	# p @user.comments

	json :comment => @comment, :user => @user
end