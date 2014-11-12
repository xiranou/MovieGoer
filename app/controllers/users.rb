get '/user/:id' do |id|
  @user = User.find(id)

  erb :"users/_single", locals:{user: @user}
end

get '/user/:id/reviews' do |id|
  @user = User.find(id)

  erb :"reviews/_all", locals:{reviews: @user.reviews}
end