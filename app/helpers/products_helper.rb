module ProductsHelper
	API_VERSION = Rails.application.config.API_VERSION

	def format_price price
		"$" + number_with_delimiter(price.to_i, :delimiter => ".", :separator => ",") unless price.nil?
	end


	def product_hash product_id
		{ :product_id => product_id, :version => API_VERSION }
	end

	def product_row_hash product_row_id
		{ :product_row_id => product_row_id, :version => API_VERSION }
	end

end
