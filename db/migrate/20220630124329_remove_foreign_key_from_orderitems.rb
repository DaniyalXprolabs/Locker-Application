class RemoveForeignKeyFromOrderitems < ActiveRecord::Migration[6.1]
  def change
    remove_foreign_key :order_items, :orders
  end
end
