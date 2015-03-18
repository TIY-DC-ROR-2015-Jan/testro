class CreateFavoriteBusStops < ActiveRecord::Migration
  def change
    create_table :favorite_bus_stops do |t|
      t.belongs_to :user, index: true
      t.belongs_to :bus_stop, index: true

      t.timestamps null: false
    end
    add_foreign_key :favorite_bus_stops, :users
    add_foreign_key :favorite_bus_stops, :bus_stops
  end
end
