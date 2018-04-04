ActiveAdmin.register AdminUser, namespace: :dispensary_admin , as: "User" do
  
  menu priority: 2, label: proc{ "User" }
  actions :all, :except => [:delete, :new]
  
  permit_params :email, :password, :password_confirmation

  index do
    selectable_column
    id_column
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    column :dispensary_id
    actions
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at
  filter :dispensary_id
  filter :role

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs do
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

end
