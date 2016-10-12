class OrderStatus < ActiveRecord::Base
  has_attached_file :image, styles: { medium: "400x400>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  validates :name, uniqueness: true

  def name_slug
    self.name.parameterize
  end
end
