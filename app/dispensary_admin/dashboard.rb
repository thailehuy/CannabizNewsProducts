ActiveAdmin.register_page "Dashboard", namespace: :dispensary_admin do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }
  
  #@dispensary = AdminUser.where(id: @current_admin_user.id).first.dispensary

  content title: proc{ I18n.t("active_admin.dashboard") } do
    # div class: "blank_slate_container", id: "dashboard_default_message" do
    #   span class: "blank_slate" do
    #     span I18n.t("active_admin.dashboard_welcome.welcome")
    #     small I18n.t("active_admin.dashboard_welcome.call_to_action")
    #   end
    # end
    
    section "Your Dispensary" do 
      table_for Dispensary.first do
        column :name
        column :location
        column :city
        column :state
        #actions
      end
    end
    
    section "Your Products" do 
      # table_for DispensarySourceProduct.limit(10) do
      #   column :name do |dispensary|
      #     link_to dispensary.name, [:admin, dispensary]
      #   end
      #   column :location
      #   column :city
      #   column :state
      # end
      # strong {link_to "View All Products", admin_products_path }
    end
    
    section "Your Orders" do 
      # table_for DispensarySourceProduct.limit(10) do
      #   column :name do |dispensary|
      #     link_to dispensary.name, [:admin, dispensary]
      #   end
      #   column :location
      #   column :city
      #   column :state
      # end
      # strong {link_to "View All Products", admin_products_path }
    end
      

    # Here is an example of a simple dashboard with columns and panels.
    #
    # columns do
    #   column do
    #     panel "Some Products" do
    #       ul do
    #         Product.limit(5)
    #       end
    #     end
    #   end

    #   column do
    #     panel "Info" do
    #       para "Welcome to Cannabiz Network."
    #     end
    #   end
    # end
  end # content
end
