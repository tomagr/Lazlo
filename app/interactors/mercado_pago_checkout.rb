class MercadoPagoCheckout < Interactor
  include Rails.application.routes.url_helpers

  def initialize(arguments)
	 super
	 @parameters = arguments.fetch :parameters
	 @user = @parameters['user']
  end

  def payment_link preference_data
	 mp_response = $mp_client.create_preference(preference_data)
	 Rails.env.development? ? mp_response['response']['sandbox_init_point'] : mp_response['response']['init_point']
  end

  def checkout
	 payment_link(checkout_preference_data)
  end

  private

  def checkout_preference_data
	 {
		  'items' => items_to_json,
		  'back_urls' => back_urls_json,
		  'payer' => payer_data,
		  'additional_info' => purchase_data
	 }
  end


  def payer_data
	 {
		  'name' => @user.name,
		  'email' => @user.email
	 }
  end

end