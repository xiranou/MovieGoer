post '/rating' do
  @rateable = Movie.find(params[:rateable_id])
  @voter = User.find(params[:voter_id])
  Rating.create(score: params[:score].to_i, rateable: @rateable, voter: @voter)

  if request.xhr?
    {score: average_score(@rateable)}.to_json
  else
    redirect '/movies'
  end
end