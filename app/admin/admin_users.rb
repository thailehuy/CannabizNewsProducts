ActiveAdmin.register AdminUser do
  permit_params :email, :password, :password_confirmation,  :dispensary_id, :role

  index do
    selectable_column
    id_column
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    column :dispensary_id
    column :role
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
      
      f.input :dispensary_id, :label => 'Dispensary', :as => :select, 
        :collection => Dispensary.all.map{|u| ["#{u.name}", u.id]}

      f.input :role
    end
    f.actions
  end

end
