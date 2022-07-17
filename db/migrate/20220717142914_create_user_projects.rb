class CreateUserProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :user_projects do |t|

      t.timestamps
    end
  end
end
