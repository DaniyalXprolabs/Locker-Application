class DropCartIdFromOrderProduct < ActiveRecord::Migration[6.1]
  def change
    remove_column :order_products, :cart_id
  end
end
