class PurchaseController < ApplicationController

  before_action :authenticate_user!

  def single_purchase_success
	 SavePurchase.for(current_user, purchase_params)
	 flash[:notice] = 'Muchas gracias por comprar en Macain! En breve nos vamos a estar contactando para coordinar la entrega. Gracias!'
	 redirect_to cart_path
  end

  def single_purchase_pending
	 params = purchase_params
	 params[:message] = 'dejó pendiente'

	 send_admin_email params
	 flash[:notice] = 'Su compra NO se concretó, quedó pendiente, Gracias.'
	 redirect_to product_path @product
  end

  def single_purchase_failure
	 params = purchase_params
	 params[:message] = 'canceló'

	 send_cancelled_purcharse_email params
	 flash[:notice] = 'Su compra ha sido cancelada. Gracias.'
	 redirect_to product_path @product
  end

  def cart_purchase_success
	 SavePurchase.for(current_user, purchase_params)
	 flash[:notice] = 'Muchas gracias por comprar en Macain! En breve nos vamos a estar contactando para coordinar la entrega. Gracias!'
	 redirect_to cart_path
  end

  def cart_purchase_pending
	 params = purchase_params
	 params[:message] = 'dejó pendiente'

	 send_admin_email params
	 flash[:notice] = 'Su compra NO se concretó, quedó pendiente, Gracias.'
	 redirect_to product_path @product
  end

  def cart_purchase_failure
	 params = purchase_params
	 params[:message] = 'canceló'

	 send_cancelled_purcharse_email params
	 flash[:notice] = 'Su compra ha sido cancelada. Gracias.'
	 redirect_to product_path @product
  end

  private
  def set_product
	 @product = Product.friendly.find(params[:product_id])
  end

  def purchase_params
	 params.permit(:collection_id, :preference_id, :payment_type, :collection_status)
  end

end
