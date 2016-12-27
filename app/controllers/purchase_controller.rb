class PurchaseController < ApplicationController

  before_action :authenticate_user!, :set_product

  def purchase_success
    create_order

    params = purchase_params
    params[:order] = @order
    params[:message] = 'concretó'

    UserMailer.purchased_product_user_notification(params).deliver_now
    send_admin_email params

    flash[:notice] = 'Muchas gracias por comprar en Macain! En breve nos vamos a estar contactando para coordinar la entrega. Gracias!'
    redirect_to product_path @product
  end

  def purchase_pending
    params = purchase_params
    params[:message] = 'dejó pendiente'

    send_admin_email params
    flash[:notice] = 'Su compra NO se concretó, quedó pendiente, Gracias.'
    redirect_to product_path @product
  end

  def purchase_failure
    params = purchase_params
    params[:message] = 'canceló'

    send_admin_email params
    flash[:notice] = 'Su compra ha sido cancelada. Gracias.'
    redirect_to product_path @product
  end


  private
  def set_product
    @product = Product.friendly.find(params[:product_id])
  end

  def purchase_params
    {
        :user => current_user,
        :product => @product,
        :image => URI.join(request.url, @product.image.url(:big) )
    }
  end

  def send_admin_email purchase_params
    AdminMailer.purchase_product_admin_notification(purchase_params).deliver_now
  end

  def create_order
    buyer = Buyer.create!(:name => current_user.email, :email => current_user.email)
    @order = Order.create!(:buyer => buyer, :product => @product, :payment => 0, :tracking_title => @product[:name],
        :order_status_id => OrderStatus.find_by_priority(1).id, :detail => 'Producto comprado dedes la Web')
  end

end