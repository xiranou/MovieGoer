class CreateComments < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :title
      t.string :content

      t.belongs_to :movie
      t.belongs_to :author

      t.timestamps
    end
  end
end
