ActiveAdmin.register AdminUser, as: "Administradores" do
  permit_params :email, :password, :password_confirmation

  index do
    selectable_column
    id_column
    column :email
    column "Ultimo Ingreso", :current_sign_in_at
    column "Ingresos", :sign_in_count
    column "Fecha de creación", :created_at
    actions
  end

  config.filters = false

  form do |f|
    f.inputs "Admin Details" do
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

end
