class EmployeeProfileAddEmployeeId < ActiveRecord::Migration
  def up
  	add_column :employee_profiles, :employees_id, :integer
  end

  def down
  	drop_table :employee_profiles
  end
end
