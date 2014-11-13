post '/rating' do
  @rateable = Movie.find(params[:rateable_id])
  @voter = User.find(params[:voter_id])
  Rating.create(score: params[:score].to_i, rateable: @rateable, voter: @voter)

  if request.xhr?
    erb :"ratings/_show_rate", locals:{rateable: @rateable, voter: @voter}, layout: false
  else
    redirect '/movies'
  end
end