class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.integer :employees_id
      t.string :name
      t.string :email
      t.integer :manager_id
      t.boolean :is_manager
      t.integer :level
      t.integer :roles_id
      t.integer :departments_id
      t.integer :documents_id
      t.integer :assets_id
      t.integer :centres_id
      t.timestamps
    end
  end
end
