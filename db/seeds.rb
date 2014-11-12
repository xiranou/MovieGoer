require 'faker'


10.times do
  Movie.create(title: Faker::Lorem.word, synopsis: Faker::Lorem.paragraph(3))
end

User.create(username: 'admin', password: 'admin')

20.times do
  User.create(username: Faker::Internet.user_name, password: Faker::Internet.password)
end

seed_movies = Movie.all
seed_users = User.all
seed_users.to_a.shift

10.times do
  seed_users.sample.reviews.create(title: Faker::Lorem.sentence, content: Faker::Lorem.paragraph, movie: seed_movies.sample)
end