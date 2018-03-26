ActiveAdmin.register Dispensary do
	
	permit_params :name, :location, :city, :admin_user_id
	
	#use with friendly id
	before_filter :only => [:show, :edit, :update, :delete] do
		@dispensary = Dispensary.friendly.find(params[:id])
	end
	
	#save queries
	includes :state, :admin_user

	#edit and new form - multipart allows for carrierwave connection
	form(:html => { :multipart => true }) do |f|
		f.inputs "Product" do
			f.input :name
			f.input :image, :as => :file
			f.input :location
			f.input :city
			f.input :state
			
			f.input :admin_user_id, :label => 'Admin User', :as => :select, 
        		:collection => AdminUser.all.map{|u| ["#{u.email}", u.id]}
		end
		f.actions
	end
	
	show do
		attributes_table do
			row :name
			row :image
			row :location
			row :city
			row :state
		end
	end

	#filters on the index page, if not specified we see all
	filter :name
	filter :state
	filter :city

	index do
		column :id
		column :name
		column :image
		column :location
		column :city
		column :state
		column :admin_user
		actions
	end

end
