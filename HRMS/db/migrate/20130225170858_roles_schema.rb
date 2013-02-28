class RolesSchema < ActiveRecord::Migration
  def up
  	add_column  :roles, :roles_id, :integer
    add_column  :roles, :role_name, :string
    add_column  :roles, :role_description, :string
  end

  def down
  	drop_table :roles
  end
end
