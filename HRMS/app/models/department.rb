class Department < ActiveRecord::Base
  attr_accessible :departments_id, :supported_role_ids

  has_many :employees, :foreign_key => 'departments_id', :class_name => 'Employee', :primary_key => 'departments_id', :dependent => :destroy

  has_many :roles, :through => :employees, :dependent => :destroy
end
