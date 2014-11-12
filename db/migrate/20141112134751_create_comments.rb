class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :content

      t.belongs_to :commenter
      t.belongs_to :review

      t.timestamps
    end
  end
end
