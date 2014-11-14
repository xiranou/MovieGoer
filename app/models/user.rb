class User < ActiveRecord::Base
  validates :username, :password, presence: true
  validates_uniqueness_of :username

  has_secure_password

  has_many :reviews, foreign_key: :author_id
  has_many :watched_movies, through: :reviews, source: :movie
  has_many :comments, foreign_key: :commenter_id

  has_many :ratings, foreign_key: :voter_id

  has_many :rated_movies, through: :ratings, source: :rateable, source_type: "Movie", foreign_key: :voter_id
  has_many :rated_reviews, through: :ratings, source: :rateable, source_type: "Review", foreign_key: :voter_id
  has_many :rated_comments, through: :ratings, source: :rateable, source_type: "Comment", foreign_key: :voter_id
  has_many :rated_users, through: :ratings, source: :rateable, source_type: "User", foreign_key: :voter_id
end
