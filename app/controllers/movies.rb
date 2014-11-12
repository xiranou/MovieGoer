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

  erb :"movies/_single", locals:{movie: @movie}
end

get '/movie/:id/reviews' do |id|
  @movie = Movie.find(id)

  erb :"reviews/_all", locals:{reviews: @movie.reviews}
end

get '/movie/:id/review/new' do |id|
  @movie = Movie.find(id)

  erb :"reviews/_new_single", locals:{movie: @movie}
end

post '/movie/:id/review' do |id|
  movie = Movie.find(id)
  Review.create(params[:review])

  redirect "/movie/#{movie.id}/reviews"
end