ActiveAdmin.register Purchase, as: "Redenciones"  do
  actions :all, except: [:new, :create, :destroy]

  permit_params :status

  menu priority: 4

  scope "Todos", :all, :default => true

  scope("Pendientes") { |scope| scope.where(status: "Pendiente") }
  scope("Enviados") { |scope| scope.where(status: "Enviado") }

  filter :user, label: 'Usuario'
  filter :product, label: 'Producto'
  filter :quantity, label: 'Cantidad'
  filter :status, label: 'Estado'
  filter :created_at, label: 'Fecha de creación'
  filter :updated_at, label: 'Ultima modificación'

  index do
    column("Usuario", :user, :sortable => :user_id)
    column("Producto", :product, :sortable => :product_id)
    column "Cantidad", :quantity
    column("Estado") {|purchase| status_tag(purchase.status) }
    column "Fecha de creación", :created_at
    column "Ultima modificación", :updated_at
    actions
  end

  show do
    attributes_table do
      row("Usuario") {|purchase| purchase.user }
      row("Producto") {|purchase| purchase.product }
      row "Foto del producto", :product_img do |purchase|
        link_to purchase.product.image1.url do
          image_tag(purchase.product.image1.url(:small))
        end
      end
      row("Cantidad redimida") {|purchase| purchase.quantity }
      row("Dirección de usuario") {|purchase| purchase.user.address }
      row("Teléfono de usuario") {|purchase| purchase.user.phone }
      row("Celular de usuario") {|purchase| purchase.user.mobile_phone }
      row("Estado") {|purchase| purchase.status }
      row("Fecha de creación") {|purchase| purchase.created_at }
      row("Ultima modificación") {|purchase| purchase.updated_at }
    end
    active_admin_comments
  end

  form do |f|
    f.semantic_errors
    f.inputs "Estado del envió de la redención" do
      f.input :status, :label => "Estado", as: :select, collection: ["Pendiente", "Enviado"]
    end
    f.actions
  end
end
