class CreateMercadoPagoPurchases < ActiveRecord::Migration
  def change
	 create_table :mercado_pago_purchases do |t|

		t.references :user, null: false, index: true
		t.references :checkout_list, null: false, index: true

		t.string :collection_id
		t.string :prefrence_id
		t.string :payment_type
		t.string :status

		t.timestamps null: false
	 end
  end
end
