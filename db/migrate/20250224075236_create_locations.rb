class CreateLocations < ActiveRecord::Migration[7.1]
  def change
    create_table :locations do |t|
      t.string :street
      t.string :number
      t.string :npa
      t.string :canton
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
