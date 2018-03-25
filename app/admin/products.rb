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
	
	#use with friendly id
	before_filter :only => [:show, :edit, :update, :delete] do
		@product = Product.friendly.find(params[:id])
	end

	#scopes
	scope :all, default: true
	scope :featured
	
	#save queries
	includes :category
	
	#import csv (might make my own for the update)
	active_admin_import
	

	#edit and new form - multipart allows for carrierwave connection
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


	#filters on the index page, if not specified we see all
	filter :name
	filter :category
	filter :featured_product, as: :check_boxes

	index do 
		column :id
		column :name
		column :description
		column :category
		column :featured_product
		actions
	end

end
