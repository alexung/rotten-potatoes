get '/movie/:id' do
	@movie = Movie.find(params[:id])
	erb :movie
end