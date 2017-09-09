# == Schema Information
#
# Table name: pages
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe Page, type: :model do

  it { should respond_to(:page_images) }
  it { should have_many(:page_images) }

end
