get '/movies' do
  @movies = Movie.all

  erb :"movies/_all", locals:{movies: @movies}
end

get '/movie/random' do
  @rand_movie = Movie.all.to_a.sample

  erb :"movies/_single", locals:{movie: @movie}
end

get '/movie/:id' do |id|
  @movie = Movie.find(id)

  erb :"movies/_single", locals:{movie: @movie}
end
