class CreateCentres < ActiveRecord::Migration
  def change
    create_table :centres do |t|

      t.timestamps
    end
  end
end
