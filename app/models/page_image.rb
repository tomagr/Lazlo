# == Schema Information
#
# Table name: page_images
#
#  id                   :integer          not null, primary key
#  caption              :string(255)
#  page_id              :integer
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  picture_file_name    :string(255)
#  picture_content_type :string(255)
#  picture_file_size    :integer
#  picture_updated_at   :datetime
#

class PageImage < ApplicationRecord
  belongs_to :page

  has_attached_file :picture,
                    styles: {slider: "1400x695#", big: "800x800>", medium: "300x300>", thumb: "100x100>"},
                    default_url: "/images/:style/missing.png", :preserve_files => true

  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\Z/

end
