class CreatePageImages < ActiveRecord::Migration[4.2]
  def change
    create_table :page_images do |t|
      t.string :caption
      t.belongs_to :page

      t.timestamps null: false
    end
  end
end
