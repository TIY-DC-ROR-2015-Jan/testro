class CreateBusStops < ActiveRecord::Migration
  def change
    create_table :bus_stops do |t|
      t.string :name
      t.string :stop_id
      t.float :latitude
      t.float :longitude

      t.timestamps null: false
    end
  end
end
