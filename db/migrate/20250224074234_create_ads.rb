class CreateAds < ActiveRecord::Migration[7.1]
  def change
    create_table :ads do |t|
      t.string :title
      t.text :description
      t.decimal :price
      t.references :category, foreign_key: true # Corrigido para relacionamento correto
      t.references :user, foreign_key: true
  
      t.timestamps
    end
  end  
end
