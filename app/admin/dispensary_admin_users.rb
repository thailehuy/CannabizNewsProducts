ActiveAdmin.register DispensaryAdminUser do
	permit_params :email, :password, :password_confirmation, :role, :dispensary

  index do
    selectable_column
    id_column
    column :email
    column :dispensary
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    column :role
    actions
  end

  filter :email
  filter :dispensary
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs do
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :dispensary
      f.input :role
    end
    f.actions
  end

end
