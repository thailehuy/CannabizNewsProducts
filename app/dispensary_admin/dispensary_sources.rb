ActiveAdmin.register DispensarySource do
	belongs_to :dispensary
	permit_params :name, :image, :location, :street, :city, :zip_code, 
					:facebook, :instagram, :twitter, :website, :email, :phone, :min_age,
					:monday_open_time, :monday_close_time, :tuesday_open_time, :tuesday_close_time,
					:wednesday_open_time, :wednesday_close_time, :thursday_open_time, :thursday_close_time,
					:friday_open_time, :friday_close_time, :saturday_open_time, :saturday_close_time,
					:sunday_open_time, :sunday_close_time
end
