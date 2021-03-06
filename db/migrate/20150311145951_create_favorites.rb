class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.belongs_to :user, index: true
      t.belongs_to :metro, index: true

      t.timestamps null: false
    end
    add_foreign_key :favorites, :users
    add_foreign_key :favorites, :metros
  end
end
