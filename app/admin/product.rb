ActiveAdmin.register Product do
  menu priority: 1

  permit_params :name, :description, :price, :product_type_id, :image

  filter :name
  filter :price
  filter :created_at

  index do
    selectable_column

    column :name
    column 'Precio' do |product|
      '$' + product.price.to_s
    end
    column 'Tipo de Producto' do |product|
      ProductType.find(product.product_type_id).name
    end
    column :image do |product|
      image_tag(product.image.url(:thumb), :class => 'product-thumb')
    end

    actions
  end


  form do |f|
    f.inputs do
      f.input :name
      f.input :description
      f.input :price
      f.input :product_type_id, :as => :select, include_blank: false, collection: ProductType.all
      f.input :image, :as => :file, :hint => image_tag(f.object.image.url(:thumb))
    end

    actions
  end

  show do |product|

    attributes_table_for product do
      row 'Nombre' do
        product.name
      end
      row 'Descripcion' do
        product.description
      end
      row 'Precio' do
        product.price
      end
      row 'Tipo de producto' do
        ProductType.find(product.product_type_id).name
      end
      row :image do
        image_tag(product.image.url(:medium))
      end

    end
  end

end
