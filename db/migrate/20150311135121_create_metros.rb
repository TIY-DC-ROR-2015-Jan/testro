class CreateMetros < ActiveRecord::Migration
  def change
    create_table :metros do |t|
      t.string :name
      t.string :code
      t.float :latitude
      t.float :longitude

      t.timestamps null: false
    end
  end
end
