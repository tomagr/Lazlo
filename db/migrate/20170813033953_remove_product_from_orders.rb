class RemoveProductFromOrders < ActiveRecord::Migration
  def change
	 add_reference :orders, :products, index: true, foreign_key: true
  end
end
