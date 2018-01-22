class AddProductTypesToProducts < ActiveRecord::Migration[4.2]
  def change
    add_reference :products, :product_type, index: true, foreign_key: true
  end
end
