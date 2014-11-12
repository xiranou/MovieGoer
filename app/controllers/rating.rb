post '/rating' do
  @movie = Movie.find(params[:rateable_id])
  @voter = User.find(params[:rateable_id])
  Rating.create(score: params[:score], rateable: @movie, voter: @voter)

  redirect '/movies'
end