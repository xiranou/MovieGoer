get '/user/:id' do |id|
  @user = User.find(id)

  erb :"users/_single", locals:{user: @user}
end

get '/user/:id/reviews' do |id|
  @user = User.find(id)

  erb :"reviews/_all", locals:{reviews: @user.reviews}
end

get '/user/:id/reviewed_movies' do |id|
  @user = User.find(id)

  erb :"movies/_all", locals:{movies: @user.watched_movies}
end

get '/user/:id/rated_movies' do |id|
  @user = User.find(id)

  erb :"movies/_all", locals:{movies: @user.rated_movies}
end