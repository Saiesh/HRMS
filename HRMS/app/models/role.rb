class Role < ActiveRecord::Base
  attr_accessible :roles_id, :roles_name

  has_many :employees, :foreign_key => 'roles_id', :class_name => 'Employee', :primary_key => 'roles_id'

  has_many :departments, :through => :employees
end
