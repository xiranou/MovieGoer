get '/movies' do
  @movies = Movie.all

  erb :"movies/_all", locals:{movies: @movies}
end