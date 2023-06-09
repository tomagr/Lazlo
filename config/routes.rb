Rails.application.routes.draw do

	mount LetsencryptPlugin::Engine, at: '/'

	begin
		ActiveAdmin.routes(self)
	rescue Exception => e
		puts "ActiveAdmin: #{e.class}: #{e}"
	end

	devise_for :admin_users, ActiveAdmin::Devise.config

	devise_for :users, :controllers => { :omniauth_callbacks => 'omniauth_callbacks' }


	root 'home#index'

	resources :categories
	get '/destacados' => 'categories#featured', :as => :featured

	resources :products do
		get 'checkout', to: 'products#purchase'
	end

	#get '/cotizador' => 'home#cotizador'

	get '/me' => 'users#profile', :as => :profile


	post '/contact_email' => 'api/v1/users#contact_email'
	post '/add_to_newsletter' => 'api/v1/users#add_to_newsletter', :as => :add_to_newsletter

	get '/tracking/:tracking_code' => 'orders#tracking', :as => :tracking_order_by_code

	# Checkout
	get '/checkout' => 'checkout#show', :as => :checkout
	get 'single-checkout-success', to: 'checkout#single_checkout_success'
	get 'single-checkout-pending', to: 'checkout#single_checkout_pending'
	get 'single-checkout-cancelled', to: 'checkout#single_checkout_cancelled'

	get 'cart-checkout-success', to: 'checkout#cart_checkout_success'
	get 'cart-checkout-pending', to: 'checkout#cart_checkout_pending'
	get 'cart-checkout-cancelled', to: 'checkout#cart_checkout_cancelled'

	# API
	scope module: 'api' do
		scope '1', module: 'v1' do
			get 'user/favourites' => 'favourites#index'

			# Cart
			get 'user/products_in_cart', to: 'cart#get_products_in_cart', :as => :product_in_cart
			post 'user/checkout/:product_id', to: 'cart#add_product_to_cart', :as => :add_product_to_cart
			put 'user/checkout_row/:product_row_id', to: 'cart#edit_checkout_product_row', :as => :edit_checkout_row
			delete 'user/cart/:product_id', to: 'cart#remove_cart_product_row', :as => :remove_cart_product_row

			# Favourites
			post 'user/favourites/:product_id', to: 'favourites#create', :as => :add_product_to_favourites
			delete 'user/favourites/:product_id', to: 'favourites#destroy', :as => :remove_product_from_favourites

			post '/chat_response' => 'chat#dialog_flow_response'
		end
	end

	# error pages
	%w( 404 422 500 503 ).each do |code|
		get code, :to => 'errors#show', :code => code
	end


end
