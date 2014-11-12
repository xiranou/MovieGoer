get '/user/:id' do |id|
  @user = User.find(id)

  erb :"users/_single", locals:{user: @user}
end