class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :title, null: false
      t.text :description
      t.references :category, null: false, foreign_key: true
      t.decimal :price, precision: 10, scale: 2
      t.integer :images_count

      t.timestamps
    end
  end
end
