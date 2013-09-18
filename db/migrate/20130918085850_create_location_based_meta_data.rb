class CreateLocationBasedMetaData < ActiveRecord::Migration
  def change
    create_table :location_based_meta_data do |t|
      t.string :name
      t.integer :location_based_data_id

      t.timestamps
    end
  end
end
