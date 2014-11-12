get '/reviews' do
  @reviews = Review.all

  erb :"reviews/_all", locals:{reviews: @reviews}
end

get '/movie/:id/reviews' do |id|
  @movie = Movie.find(id)

  erb :"reviews/_all", locals:{reviews: @movie.reviews}
end

get '/movie/:id/review/new' do |id|
  @movie = Movie.find(id)

  erb :"reviews/_new", locals:{movie: @movie}
end

post '/movie/:id/review' do |id|
  movie = Movie.find(id)
  Review.create(params[:review])

  redirect "/movie/#{movie.id}/reviews"
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