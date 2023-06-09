# == Schema Information
#
# Table name: marvels
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  price      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Marvel < ApplicationRecord

  validates :name, presence: true
  validates :price, presence: true

end
