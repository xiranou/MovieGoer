class AddVoterIdToRatings < ActiveRecord::Migration
  def change
    add_column :ratings, :voter_id, :integer
  end
end
