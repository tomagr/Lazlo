class AddPaymentToOrder < ActiveRecord::Migration[4.2]
  def change
    add_column :orders, :payment, :integer
  end
end
