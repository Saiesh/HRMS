class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :addressLine1
      t.string :addressLine2
      t.string :city
      t.string :state
      t.integer :pincode
      t.timestamps
    end
  end
end
