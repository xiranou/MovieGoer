class User < ActiveRecord::Base
  validates :username, :password, presence: true
  validates_uniqueness_of :username

  has_secure_password

  has_many :reviews, foreign_key: :author_id
  has_many :watched_movies, through: :reviews, source: :movie
  has_many :comments, foreign_key: :commenter_id
end
