ActiveAdmin.register Dispensary, namespace: :dispensary_admin , as: "Dispensary" do
	
	menu priority: 3, label: proc{ "Dispensary" }
	
	##GOING TO USE NESTED RESOURCE FOR DISPENSARY_SOURCE
	
	actions :all, :except => [:new, :import, :destroy, :delete]
	
	# controller do
	# 	load_resource :except => :index
	# end

#	permit_params :name	
	permit_params do
		permitted = [:name, dispensary_source_attributes: [:id, :name, :image, :location, 
			:street, :city, :zip_code, 
			:facebook, :instagram, :twitter, :website, :email, :phone, :min_age,
			:monday_open_time, :monday_close_time, :tuesday_open_time, :tuesday_close_time,
			:wednesday_open_time, :wednesday_close_time, :thursday_open_time, :thursday_close_time,
			:friday_open_time, :friday_close_time, :saturday_open_time, :saturday_close_time,
			:sunday_open_time, :sunday_close_time]]
	end
	
	#use with friendly id
	before_filter :only => [:show, :edit, :update, :delete] do
		@dispensary = Dispensary.friendly.find(params[:id])
	end
	
	#no filters
	before_filter :skip_sidebar!, :only => :index

	#scopes
	scope_to :current_user
	#scope :mine, default: true
	
	#save queries
	includes :state
	
	#needed for DispensarySource
	source_id = Source.where(name: 'Self').where(source_type: 'Dispensary').first

	#edit and new form - multipart allows for carrierwave connection
	form(:html => { :multipart => true }) do |f|
		f.inputs "Dispensary" do
			f.has_many :dispensary_sources, heading: nil, allow_destroy: false, 
						new_record: false do |ff|
			
				ff.input :name
				ff.input :location
				ff.input :monday_open_time, :as => :time_picker
				ff.input :monday_close_time, :as => :time_picker
				ff.input :tuesday_open_time, :as => :time_picker
				ff.input :tuesday_close_time, :as => :time_picker
				ff.input :wednesday_open_time, :as => :time_picker
				ff.input :wednesday_close_time, :as => :time_picker
				ff.input :thursday_open_time, :as => :time_picker
				ff.input :thursday_close_time, :as => :time_picker
				ff.input :friday_open_time, :as => :time_picker
				ff.input :friday_close_time, :as => :time_picker
				ff.input :saturday_open_time, :as => :time_picker
				ff.input :saturday_close_time, :as => :time_picker
				ff.input :sunday_open_time, :as => :time_picker
				ff.input :sunday_close_time, :as => :time_picker
			end
		end
		f.actions
	end
	
	
	
	show do |record|
		attributes_table do
			row :name
			row :image
			row :location
			row :city
			row :state
		end
		panel 'Media / Contact' do
	      table_for DispensarySource.where(source_id: source_id).
	    			where(dispensary_id: record.id).first do

	        column :facebook
	        column :twitter
	        column :instagram
	        column :website
	        column :email
	        column :phone
	        column :min_age, label: 'Minimum Age'
	      end
	    end
		panel 'Hours' do
	      table_for DispensarySource.where(source_id: source_id).
	    			where(dispensary_id: record.id).first do

	        column :monday_open_time
	        column :monday_close_time
	        column :tuesday_open_time
	        column :tuesday_close_time
	        column :wednesday_open_time
	        column :wednesday_close_time
	        column :thursday_open_time
	        column :thursday_close_time
	        column :friday_open_time
	        column :friday_close_time
	        column :saturday_open_time
	        column :saturday_close_time
	        column :sunday_open_time
	        column :sunday_close_time
	      end
	    end
	end

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
