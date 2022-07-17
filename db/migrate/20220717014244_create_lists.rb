class CreateLists < ActiveRecord::Migration[7.0]
  def change
    create_table :lists do |t|
      t.string :title
      t.references :project
      
      t.timestamps
    end
  end
end
