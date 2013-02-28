class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.integer :roles_id
      t.string :role_name
      t.string :role_description
      t.timestamps
    end
  end
end
