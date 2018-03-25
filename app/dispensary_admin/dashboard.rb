ActiveAdmin.register_page "Dashboard", namespace: :dispensary_admin do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    # div class: "blank_slate_container", id: "dashboard_default_message" do
    #   span class: "blank_slate" do
    #     span I18n.t("active_admin.dashboard_welcome.welcome")
    #     small I18n.t("active_admin.dashboard_welcome.call_to_action")
    #   end
    # end
    
    # section "New Products" do 
    #   table_for Product.featured.limit(5) do
    #     column :name do |product|
    #       link_to product.name, [:admin, product]
    #     end
    #     column :description
    #     column :category
    #   end
    #   strong {link_to "View All Products", admin_products_path }
    # end
      

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
