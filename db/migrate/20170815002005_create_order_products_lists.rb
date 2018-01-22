class CreateOrderProductsLists < ActiveRecord::Migration[4.2]
  def change
	 if !table_exists?("order_products_lists")
		create_table :order_products_lists do |t|
		  t.belongs_to :order
		  t.timestamps null: false
		end
	 end
  end
end
