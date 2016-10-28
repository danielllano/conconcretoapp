ActiveAdmin.register Parameter, as: "Parametro" do

  permit_params :key, :value
  menu priority: 4
  config.filters = false

  index do
    column "Nombre", :key
    column "Valor (Puntos)", :value
    # column "Unidades", :unit
    column "Fecha de creación", :created_at
    column "Ultima modificación", :updated_at
    actions
  end

  show do
    attributes_table do
      row("Nombre") {|parameter| parameter.key }
      row("Valor (Puntos)") {|parameter| parameter.value }
      # row("Unidades") {|parameter| parameter.unit }
      row("Fecha de creación") {|parameter| parameter.created_at }
      row("Ultima modificación") {|parameter| parameter.updated_at }
    end
    active_admin_comments
  end

  form do |f|
    f.semantic_errors
    f.inputs 'Nombre', :key
    f.inputs 'Valor', :value
    # f.inputs 'Unidades', :unit
    f.actions
  end

end
