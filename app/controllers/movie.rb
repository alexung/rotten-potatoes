get 'movie/:id' do
	@movies = Movie.find(params[:id])
	erb :movie
end