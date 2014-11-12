get '/review/:id/comment/new' do |id|
  @review = Review.find(id)

  erb :"comments/_new", locals:{review: @review}
end

post '/review/:id/comment' do
  @comment = Comment.create(params[:comment])

  redirect "/review/#{@comment.review.id}"
end