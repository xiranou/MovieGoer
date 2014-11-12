class Movie < ActiveRecord::Base
  has_many :reviews
  has_many :critics, through: :reviews, source: :author

  has_many :ratings, as: :rateable
  has_many :voters, through: :ratings, source: :voter
end
