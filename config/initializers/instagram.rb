require "instagram"

#Instagram.configure do |config|
#  config.client_id = Rails.application.secrets[:instagram_client_id]
#  config.client_secret =  Rails.application.secrets[:instagram_client_secret]
#end

Hashie.logger = Logger.new('/dev/null')
INSTRAGRAM_ACCESS_TOKEN = Rails.application.secrets[:instagram_access_token]