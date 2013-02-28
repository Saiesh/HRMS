class Employee < ActiveRecord::Base
  attr_accessible :employees_id, :name, :email, :is_manager, :manager_id, :level

  # Employee -> EmployeeProfile
  has_one :employee_profile, :foreign_key => 'employees_id', :class_name => 'EmployeeProfile', :primary_key => 'employees_id', :dependent => :destroy

  # Relationships for employees and managers
  has_many :subordinates, :class_name => "Employee", :foreign_key => "manager_id", :primary_key => 'employees_id'
  belongs_to :manager, :class_name => "Employee", :primary_key => 'employees_id'

  # Employee -> Departments
  belongs_to :departments, :class_name => 'Department', :primary_key => 'departments_id'

  # Employee -> Roles
  belongs_to :roles, :class_name => 'Role', :primary_key => 'roles_id'
end
