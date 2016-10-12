include ActionView::Helpers::AssetUrlHelper

AdminUser.create!(email: 'tomas@theamalgama.com', password: 'sinclair2955', password_confirmation: 'sinclair2955')
AdminUser.create!(email: 'tomas@macain.com.ar', password: 'sinclair2955', password_confirmation: 'sinclair2955')

order_status_image = File.new(File.join(Rails.root, 'app/assets/images/logos/logo-multi.png'))
OrderStatus.create!(name: 'Entregada', image: order_status_image)

order_status_image = File.new(File.join(Rails.root, 'app/assets/images/logos/logo-red.png'))
OrderStatus.create!(name: 'Listo para entregar!', image: order_status_image)

order_status_image = File.new(File.join(Rails.root, 'app/assets/images/logos/logo-green.png'))
OrderStatus.create!(name: 'En pinturería', image: order_status_image)

order_status_image = File.new(File.join(Rails.root, 'app/assets/images/logos/logo-violet.png'))
OrderStatus.create!(name: 'En Herrería', image: order_status_image)

order_status_image = File.new(File.join(Rails.root, 'app/assets/images/logos/logo-yellow.png'))
OrderStatus.create!(name: 'Encargada', image: order_status_image)