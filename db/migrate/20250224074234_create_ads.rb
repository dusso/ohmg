class CreateAds < ActiveRecord::Migration[7.1]
  def change
    create_table :ads do |t|
      t.string :title
      t.text :description
      t.decimal :price
      t.string :category
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
