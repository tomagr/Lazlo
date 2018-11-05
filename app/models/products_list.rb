# == Schema Information
#
# Table name: products_lists
#
#  id         :integer          not null, primary key
#  type       :string(255)
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ProductsList < ApplicationRecord

	belongs_to :user
	belongs_to :order
	has_many :product_rows, :dependent => :destroy

	def save_product_row product, quantity
		product_rows.create(:product => product, :quantity => quantity)
		byebug
		save!
	end

	def products_count
		product_rows.map { |pr| pr.quantity }.sum
	end

	def products
		products = []
		product_rows.map { |pr| products.push(pr.product) }
		products
	end

end