class CreateDepartments < ActiveRecord::Migration
  def change
    create_table :departments do |t|
      t.integer :departments_id
      t.text :holidays
      t.string :description
      t.text :supported_role_ids
      t.timestamps
    end
  end
end
