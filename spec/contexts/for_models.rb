RSpec.shared_context 'create user' do |role|
	let( :user ) { create :user }
end

RSpec.shared_context 'create user with device' do
	include_context 'create user', :user
	let( :device ) { create :device, user: user }
end

RSpec.shared_context 'create category' do
	let( :category ) { create :category }
end

RSpec.shared_context 'create product' do |role|
	let( :product ) { create :product }
end