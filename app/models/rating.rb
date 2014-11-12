class Rating < ActiveRecord::Base
  belongs_to :rateable, polymorphic: true
  belongs_to :voter, class_name: "User", foreign_key: :voter_id
end
