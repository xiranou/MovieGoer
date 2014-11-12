get '/movies' do
  @movies = Movie.all

  erb :"movies/_all", locals:{movies: @movies}
end

get '/:id/reviews' do |id|
  @movie = Movie.find(id)

  erb :"reviews/_all", locals:{movie: @movie}
end