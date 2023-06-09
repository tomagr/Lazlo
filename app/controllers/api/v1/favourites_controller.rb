class Api::V1::FavouritesController < Api::V1::ApiController

	def index
		products = current_user.favourites.map { |favourite| favourite.product }
		render_products_response products
	end

	def create
		favourite = CreateFavourite.with(
			user: current_user,
			product: Product.find(params[:product_id])
		)

		render_successful_response favourite.product
	end

	def destroy
		DeleteFavourite.with(
			user: current_user,
			product: Product.find(params[:product_id]),
		)
		render_successful_empty_response
	end

end