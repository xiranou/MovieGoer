class Comment < ActiveRecord::Base
  belongs_to :commenter, class_name: "User", foreign_key: :commenter_id
  belongs_to :review

  belongs_to :parent, class_name: "Comment"
  has_many :replies, class_name: "Comment", foreign_key: :parent_id, dependent: :destroy

  has_many :ratings, as: :rateable
  has_many :voters, through: :ratings, source: :voter
end
