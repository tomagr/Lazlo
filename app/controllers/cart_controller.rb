class CartController < ApplicationController

  before_action :authenticate_user!

  def show

  end

  def checkout
	 params[:user] = current_user
	 @checkout_link = MercadoPagoCartCheckout.(parameters: params, delegate: self).checkout
  end

end