class AddAttachmentPictureToProductImages < ActiveRecord::Migration[4.2]
  def self.up
    change_table :product_images do |t|
      t.attachment :picture
    end
  end

  def self.down
    remove_attachment :product_images, :picture
  end
end
