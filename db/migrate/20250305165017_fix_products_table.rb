class FixProductsTable < ActiveRecord::Migration[7.1]
  def change
    rename_column :products, :name, :title
    remove_column :products, :category, :string
    add_column :products, :stock, :integer, default: 0, null: false
    change_column :products, :price, :decimal, precision: 10, scale: 2, null: false
    change_column_null :products, :user_id, false
  end
end
