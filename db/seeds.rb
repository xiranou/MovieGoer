require 'faker'


10.times do
  Movie.create(title: Faker::Lorem.word, synopsis: Faker::Lorem.paragraph(3))
end