class CreateLocationBasedData < ActiveRecord::Migration
  def change
    create_table :location_based_data do |t|
      t.string :locationable_type
      t.integer :locationable_id
      t.integer :location_id
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
