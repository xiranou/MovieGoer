get '/review/:id/comment/new' do |id|
  @review = Review.find(id)

  erb :"comments/_new", locals:{review: @review}
end