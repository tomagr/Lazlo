# == Schema Information
#
# Table name: mercado_pago_purchases
#
#  id               :integer          not null, primary key
#  user_id          :integer          not null
#  checkout_list_id :integer          not null
#  collection_id    :string
#  preference_id     :string
#  payment_type     :string
#  status           :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class MercadoPagoPurchase < ActiveRecord::Base

  belongs_to :user
  belongs_to :checkout_list

  enum status: [:initial, :authorized, :paused, :cancelled, :pending]

  def update_by_mp_response params
	 self.update_attributes(
		  :collection_id => params["collection_id"],
		  :preference_id => params["preference_id"],
		  :payment_type => params["payment_type"],
		  :status => params["collection_status"]
	 )
  end
end
