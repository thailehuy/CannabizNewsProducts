ActiveAdmin.register DispensarySourceProduct, namespace: :dispensary_admin , as: "Products"  do
	
	menu priority: 4

	#GOING TO USE NESTED RESOURCE FOR DSP_PRICES
	form do |f|
	    f.inputs 'Product' do
	      f.input :name
	    end
	    # f.inputs do
	    #   f.has_many :comment,
	    #              new_record: 'Leave Comment' #, 
	    #              #allow_destroy: -> { |c| c.author?(current_admin_user) } do |b|
	    #   b.input :body
	    # end
    	f.actions
    end
    	
end