class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :wine_id
      t.string :name
      t.string :url
      t.float :price_min
      t.float :price_max
      t.float :price_retail
      t.string :type
      t.integer :year

      t.timestamps null: false
    end
  end
end
