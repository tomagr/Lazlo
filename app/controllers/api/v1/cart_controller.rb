class Api::V1::CartController < Api::V1::ApiController

	before_action :set_product, only: [:add_product_to_cart, :remove_cart_product_row]
	before_action :set_product_row, only: [:edit_checkout_product_row]
	before_action :set_quantity, only: [:edit_checkout_product_row, :add_product_to_cart]

	def get_products_in_cart
		render_successful_response(
			current_user.checkout_list.product_rows,
			ProductRowSerializer
		)
	end

	def add_product_to_cart
		AddProductToCart.with(user: current_user, product: @product, quantity: @quantity)
		render json: { :response => 'success' }
	end

	def edit_checkout_product_row
		if @quantity.present?
			@product_row.update_attribute(:quantity, @quantity)
			render json: { :response => 'success' }
		end
	end

	def remove_cart_product_row
		current_user.checkout_list.product_rows.find_by(:product => params[:product_id]).destroy
		render json: { :response => 'success' }
	end

	private
	def set_product
		@product = Product.friendly.find(params[:product_id])
	end

	def set_product_row
		@product_row = ProductRow.find(params[:product_row_id])
	end

	def set_quantity
		@quantity = params[:quantity].present? ? params[:quantity] : 1
	end


end