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

class PurchasedList < ProductsList

end
