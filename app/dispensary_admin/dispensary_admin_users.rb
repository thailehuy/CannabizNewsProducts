ActiveAdmin.register DispensaryAdminUser, namespace: :dispensary_admin do
	
	permit_params :email, :password, :password_confirmation

  show do
		attributes_table do
			row :email
			row :dispensary
		end
	end

  index do
    selectable_column
    id_column
    column :email
    column :dispensary
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :email
  filter :dispensary
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs do
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :dispensary
    end
    f.actions
  end

end
