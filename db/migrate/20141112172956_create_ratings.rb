class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :score
      t.belongs_to :rateable, polymorphic: true

      t.timestamps
    end
  end
end
