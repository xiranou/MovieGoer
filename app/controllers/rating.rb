post '/rating' do
  @movie = Movie.find(params[:rateable_id])
  @voter = User.find(params[:voter_id])
  Rating.create(score: params[:score].to_i, rateable: @movie, voter: @voter)

  redirect '/movies'
end