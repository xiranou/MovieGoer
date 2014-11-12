get '/reviews' do
  @reviews = Review.all

  erb :"reviews/_all", locals:{reviews: @reviews}
end