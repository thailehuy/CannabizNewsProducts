ActiveAdmin.register Product do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
	permit_params :name, :description, :featured_product, :category, :image
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
	
	before_filter :only => [:show, :edit, :update, :delete] do
		@product = Product.friendly.find(params[:id])
	end

	scope :featured #allows us to filter the index
	includes :category #saves the query
	
	#active_admin_import #import csv
	
	#import csv
	active_admin_import
	

	form(:html => { :multipart => true }) do |f|
		f.inputs "Product" do
			f.input :name
			f.input :description
			f.input :image, :as => :file
			f.input :featured_product
			f.input :category
		end
		f.actions
	end
	
	show do
		attributes_table do
			row :name do |product|
			  best_in_place product, :name, as: :input, url: [:admin,product]
			end
			row :description  do |product|
			  best_in_place product, :description, :type => :textarea
			end
			row :category
			row :featured_product
			row :image
		end
	end


	filter :name
	filter :category
	filter :featured_product

	index do 
		column :id

		column :name do |product|
			best_in_place product, :name, :type => :input
		end

		column :description  do |product|
		  best_in_place product, :description, :type => :textarea
		end
		column :category
		
		column :featured_product
		actions
	end

end
