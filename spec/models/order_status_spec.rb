# == Schema Information
#
# Table name: order_statuses
#
#  id                 :integer          not null, primary key
#  name               :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#  priority           :integer
#  visible            :boolean          default(TRUE)
#

require 'rails_helper'

RSpec.describe OrderStatus, type: :model do

  let(:a_status) { OrderStatus.create!(name: 'Por entregar', priority: 5) }

  it { should respond_to (:name) }
  it { should respond_to (:priority) }

  it { should validate_uniqueness_of(:name) }
  it { should validate_uniqueness_of(:priority) }

  it { should have_attached_file(:image) }

  describe 'when is created' do

    it 'should have validations params' do
      expect(a_status).to be_valid
    end

    it 'should have a slug from title' do
      expect(a_status.name_slug).to eq('por-entregar')
    end
  end

  describe 'When file is uploaded' do
    it 'Should have an attachment' do
      a_status.image = File.new("#{Rails.root}/spec/fixtures/images/logo-green.png")

      expect(a_status.image).to be_a(Paperclip::Attachment)
    end
  end

end
