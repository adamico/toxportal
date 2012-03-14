# encoding: UTF-8
ActiveAdmin.register Technique do
  controller do
    defaults finder: :find_by_slug
  end
  form do |f|
    f.inputs do
      f.input :name, as: :string, label: "Libéllé"
    end
    f.buttons
  end
  index do
    column :name
    default_actions
  end
  show title: :name do |technique|
    attributes_table do
      row :name
    end
  end
end
