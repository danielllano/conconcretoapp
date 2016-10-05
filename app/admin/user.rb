ActiveAdmin.register User, as: "Usuario" do

  permit_params :email, :password, :name, :last_name, :points, :address, :phone, :mobile_phone
  # menu label: "Productos"
  menu priority: 1

  scope "Todos", :all, :default => true

  # scope "Disponibles", :available
  # scope "Agotados", :not_available

  filter :email
  filter :name, label: 'Nombre'
  filter :last_name, label: 'Apellido'
  filter :points, label: 'Puntos'
  filter :address, label: 'Dirección'
  filter :phone, label: 'Teléfono'
  filter :mobile_phone, label: 'Celular'
  filter :created_at, label: 'Fecha de creación'
  filter :updated_at, label: 'Ultima modificación'

  index do
    column :email
    column "Nombre", :name
    column "Apellido", :last_name
    column "Puntos", :points
    column "Dirección", :address
    column "Teléfono", :phone
    column "Celular", :mobile_phone
    column "Fecha de creación", :created_at
    column "Ultima modificación", :updated_at
    actions
  end

  show do
    attributes_table do
      row :email
      row :name
      row :last_name
      row :points
      row :address
      row :phone
      row :mobile_phone
      row "Foto", :avatar do |product|
        link_to product.avatar.url do
          image_tag(product.avatar.url(:medium))
        end
      end
    end
    active_admin_comments
  end

  form html: { multipart: true } do |f|
    f.semantic_errors
    f.inputs :email
    f.inputs 'Constraseña', :password
    f.inputs 'Nombre', :name
    f.inputs 'Apellido', :last_name
    f.inputs 'Puntos', :points
    f.inputs 'Dirección', :address
    f.inputs 'Teléfono', :phone
    f.inputs 'Celular', :mobile_phone
    f.actions
  end

end
