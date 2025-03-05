class FixCategoryInAds < ActiveRecord::Migration[7.1]
  def change
    remove_column :ads, :category, :string  # Removemos a coluna errada
    add_reference :ads, :category, foreign_key: true  # Adicionamos a relação correta
  end
end
