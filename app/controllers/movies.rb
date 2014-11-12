get '/movies' do
  @movies = Movie.all

  if request.xhr?
    erb :"movies/_all", layout: false, locals:{movies: @movies}
  else
    erb :"movies/_all", locals:{movies: @movies}
  end
end

get '/movie/random' do
  @rand_movie = Movie.all.to_a.sample

  erb :"movies/_random", locals:{movie: @rand_movie}
end

get '/movie/:id' do |id|
  @movie = Movie.find(id)
  if request.xhr?
    erb :"movies/_single", locals:{movie: @movie}, layout: false
  else
    erb :"movies/_single", locals:{movie: @movie}
  end
end

