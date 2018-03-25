ActiveAdmin.register Dispensary, namespace: :dispensary_admin do
	
	permit_params :name, :description, :featured_product, :category, :image
	
	#use with friendly id
	before_filter :only => [:show, :edit, :update, :delete] do
		@dispensary = Dispensary.friendly.find(params[:id])
	end

	#scopes
	#scope :mine, default: true
	
	#save queries
	includes :state
	
	#import csv (might make my own for the update)
	active_admin_import
	

	#edit and new form - multipart allows for carrierwave connection
	form(:html => { :multipart => true }) do |f|
		f.inputs "Product" do
			f.input :name
			f.input :image, :as => :file
			f.input :location
			f.input :city
			f.input :state
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
		actions
	end

end
