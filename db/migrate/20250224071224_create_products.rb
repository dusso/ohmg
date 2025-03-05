class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :title, null: false
      t.text :description
      t.decimal :price, precision: 10, scale: 2, null: false
      t.integer :stock, default: 0, null: false
      t.references :user, foreign_key: true, null: false

      t.timestamps
    end
  end
end
