ActiveAdmin.register Product, as: "Producto" do
  permit_params :name, :description, :points, :available_qty, :image1, :image2, :image3
  # menu label: "Productos"
  menu priority: 3

  scope "Todos", :all, :default => true

  scope "Disponibles", :available
  scope "Agotados", :not_available

  filter :name, label: 'Nombre'
  filter :description, label: 'Descripción'
  filter :points, label: 'Puntos'
  filter :available_qty, label: 'Unidades'
  filter :created_at, label: 'Fecha de creación'
  filter :updated_at, label: 'Ultima modificación'

  index do
    column "Nombre", :name
    column "Descripción", :description
    column "Puntos", :points
    column "Unidades", :available_qty
    column "Foto", :image1 do |product|
      div do
        link_to admin_producto_path(product) do
          image_tag(product.image1.url(:small), class: "admin-mini-img")
        end
      end
    end
    column "Fecha de creación", :created_at
    column "Ultima modificación", :updated_at
    actions
  end

  index as: :grid do |product|
    div do
      link_to admin_producto_path(product) do
        image_tag(product.image1.url(:small), class: "admin-thumb-img")
      end
    end
    a truncate(product.name), :href => admin_producto_path(product)
  end

  csv do
    column("Nombre") {|product| product.name }
    column("Descripcion") {|product| product.description }
    column("Puntos") {|product| product.points }
    column("Unidades") {|product| product.available_qty }
    column("Fecha de creacion") {|product| product.created_at }
    column("Ultima modificacion") {|product| product.updated_at }
  end

  show do
    attributes_table do
      row("Nombre") {|product| product.name }
      row("Descripción") {|product| product.description }
      row("Puntos") {|product| product.points }
      row("Unidades") {|product| product.available_qty }
      row("Fecha de creación") {|product| product.created_at }
      row("Ultima modificación") {|product| product.updated_at }
      row "Foto principal", :image1 do |product|
        link_to product.image1.url do
          image_tag(product.image1.url(:small), class: "admin-thumb-img")
        end
      end
      row "Foto 2", :image2 do |product|
        link_to product.image2.url do
          image_tag(product.image2.url(:small), class: "admin-thumb-img")
        end
      end
      row "Foto 3", :image3 do |product|
        link_to product.image3.url do
          image_tag(product.image3.url(:small), class: "admin-thumb-img")
        end
      end
    end
    active_admin_comments
  end

  form html: { multipart: true } do |f|
    f.semantic_errors
    f.inputs 'Nombre', :name
    f.inputs 'Descripción', :description
    f.inputs 'Puntos', :points
    f.inputs 'Cantidad disponible', :available_qty
    f.inputs "Foto Principal" do
      f.input :image1, required: true, :as => :file, :hint => f.template.image_tag(f.object.image1.url(:small), class: "admin-mini-img")
    end
    f.inputs "Foto 2" do
      f.input :image2, required: false, :as => :file, :hint => f.template.image_tag(f.object.image2.url(:small), class: "admin-mini-img")
    end
    f.inputs "Foto 3" do
      f.input :image3, required: false, :as => :file, :hint => f.template.image_tag(f.object.image3.url(:small), class: "admin-mini-img")
    end
    f.actions
  end

end
