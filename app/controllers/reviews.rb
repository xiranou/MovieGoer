get '/movie/:id/reviews' do |id|
  @movie = Movie.find(id)

  if request.xhr?
    erb :"reviews/_all", locals:{reviews: @movie.reviews}, layout: false
  else
    erb :"reviews/_all", locals:{reviews: @movie.reviews}
  end

end

get '/movie/:id/review/new' do |id|
  @movie = Movie.find(id)

  if request.xhr?
    erb :"reviews/_new_single", layout: false, locals:{movie: @movie}
  else
    erb :"reviews/_new_single", locals:{movie: @movie}
  end
end

post '/movie/:id/review' do |id|
  movie = Movie.find(id)
  Review.create(params[:review])

  redirect "/movie/#{movie.id}/reviews"
end

get '/reviews' do
  @reviews = Review.all

  if request.xhr?
    erb :"reviews/_all", locals:{reviews: @reviews}, layout: false
  else
    erb :"reviews/_all", locals:{reviews: @reviews}
  end
end

get '/review/new' do
  @movies = Movie.all

  if request.xhr?
    erb :"reviews/_new_all", locals:{movies: @movies}, layout: false
  else
    erb :"reviews/_new_all", locals:{movies: @movies}
  end
end

post '/review' do
  @review = Review.create(params[:review])
  movie = @review.movie

  redirect "/movie/#{movie.id}/reviews"
end

get '/review/random' do
  @rand_review = Review.all.to_a.sample

  erb :"reviews/_random", locals:{review: @rand_review}
end

get '/review/:id' do |id|
  @review = Review.find(id)

  erb :"reviews/_single", locals:{review: @review}
end

get '/review/:id/edit' do |id|
  @review = Review.find(id)

  erb :"reviews/_edit", locals:{review: @review}
end

put '/review/:id' do |id|
  @review = Review.find(id)
  movie = @review.movie
  @review.update(params[:review])

  redirect "/movie/#{movie.id}/reviews"
end

get '/review/:id/delete' do |id|
  @review = Review.find(id)

  erb :"reviews/_delete", locals:{review: @review}
end

delete '/review/:id' do |id|
  @review = Review.find(id)
  movie = @review.movie
  @review.destroy

  redirect "/movie/#{movie.id}/reviews"
end