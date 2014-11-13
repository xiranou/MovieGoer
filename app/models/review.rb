class Review < ActiveRecord::Base
  belongs_to :author, class_name: "User", foreign_key: :author_id
  belongs_to :movie
  has_many :comments, dependent: :destroy

  has_many :ratings, as: :rateable
  has_many :voters, through: :ratings, source: :voter
end
