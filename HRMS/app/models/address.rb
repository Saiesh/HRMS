class Address < ActiveRecord::Base
  attr_accessible :id

  belongs_to :employee_profile
end
