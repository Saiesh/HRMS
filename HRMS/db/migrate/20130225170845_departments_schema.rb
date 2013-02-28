class DepartmentsSchema < ActiveRecord::Migration
  def up
  	add_column :departments, :departments_id, :integer
    add_column :departments, :holidays, :string
    add_column :departments, :description, :string
    add_column :departments, :supported_role_ids, :text
  end

  def down
  	drop_table :departments
  end
end
