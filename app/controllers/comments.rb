get '/review/:id/comments' do |id|
  @review = Review.find(id)

  erb :"comments/_all", locals:{comments: @review.comments}
end

get '/comment/:id' do |id|
  @comment = Comment.find(id)

  erb :"comments/_single", locals:{comment: @comment}
end

get '/review/:id/comment/new' do |id|
  @review = Review.find(id)

  erb :"comments/_new", locals:{review: @review}
end

post '/review/:id/comment' do
  @comment = Comment.create(params[:comment])

  redirect "/review/#{@comment.review.id}"
end

get '/comment/:id/reply/new' do |id|
  @comment = Comment.find(id)

  erb :"comments/_reply", locals:{parent: @comment}
end

post '/comment/:id/reply' do |_|
  comment = Comment.create(params[:reply])

  redirect "/review/#{comment.review_id}"
end

get '/comment/:id/edit' do |id|
  comment = Comment.find(id)

  erb :"comments/_edit", locals:{comment: comment}
end