class CreateEmployeeProfiles < ActiveRecord::Migration
  def change
    create_table :employee_profiles do |t|
      t.date :dob
      t.integer :accounts_id
      t.float :bankAccount_number
      t.integer :address_id
      t.timestamps
    end
  end
end
