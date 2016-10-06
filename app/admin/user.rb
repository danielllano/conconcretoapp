ActiveAdmin.register User, as: "Usuario" do

  permit_params :email, :password, :name, :last_name, :points, :address, :phone, :mobile_phone

  menu priority: 1

  scope "Todos", :all, :default => true

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
      row("Nombre") {|user| user.name }
      row("Apellido") {|user| user.last_name }
      row("Puntos") {|user| user.points }
      row("Dirección") {|user| user.address }
      row("Teléfono") {|user| user.phone }
      row("Celular") {|user| user.mobile_phone }
      row("Fecha de creación") {|user| user.created_at }
      row("Ultima modificación") {|user| user.updated_at }
      row "Foto", :avatar do |user|
        link_to user.avatar.url do
          image_tag(user.avatar.url(:medium))
        end
      end
    end
    active_admin_comments
  end

  form do |f|
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

  controller do
    def update_resource(object, attributes)
      update_method = attributes.first[:password].present? ? :update_attributes : :update_without_password
      object.send(update_method, *attributes)
    end
  end

end
