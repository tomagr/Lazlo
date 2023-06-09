class CategoriesController < ApplicationController

	before_action :set_request, :set_category, :set_meta_data, except: [:featured]
	before_action :set_section

	def show
		@products = Product.visible.where(category_id: @category)
	end

	def featured
		@products = Product.featured
		set_og_tags 'Productos Destacados'
		@current_section = 'featured'
	end

	def set_request
		$request = request
	end

	private
	def set_category
		@category = Category.friendly.find(params[:id])
		@category.update_attribute(:views, @category.views + 1)
	end

	def set_meta_data
		set_og_tags @category.name,
			@category.description,
			resource_absolute_path(@category.image.url(:medium))
	end

	def set_section
		@current_section = 'products'
	end

end
