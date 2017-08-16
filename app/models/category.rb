# == Schema Information
#
# Table name: categories
#
#  id                 :integer          not null, primary key
#  name               :string(255)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer
#  image_updated_at   :datetime
#  slug               :string(255)
#  views              :integer          default(0)
#

class Category < ActiveRecord::Base
  include Rails.application.routes.url_helpers

  extend FriendlyId

  friendly_id :name, use: :slugged

  before_save :parse_slug


  belongs_to :product

  has_attached_file :image,
                    styles: {big: "800x800>", medium: "450x300>", thumb: "100x100>"},
                    default_url: "/images/:style/missing.png", :preserve_files => true
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/


  def parse_slug
    self.slug = self.name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  end

end
