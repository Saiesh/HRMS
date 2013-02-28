class EmployeeProfile < ActiveRecord::Base
  attr_accessible :employees_id, :address_id

  #Employee <- EmployeeProfile
  belongs_to :employee, :class_name => 'Employee'

  #EmployeeProfile -> Address
  has_one :address, :class_name => 'Address', :foreign_key => 'id', :primary_key => 'address_id', :dependent => :destroy

end
