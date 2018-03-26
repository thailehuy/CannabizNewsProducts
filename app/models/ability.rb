class Ability
  include CanCan::Ability

  def initialize(user)
  
    can :read, :all # permissions for every user, even if not logged in 
    
    if user.present?
      if user.role = 99
        can :manage, :all
      else
        can :read, ActiveAdmin::Page, name: "Dashboard", namespace_name: "dispensary_admin"
        can :create, DispensarySourceProduct
        can :create, DspPrice
        can :read, Product
        can :manage, AdminUser, id: user.id
      
        #need to set the adminuser id on dispensary table
        can :manage, Dispensary do |dispensary|
          dispensary.admin_user == user
        end
        can :manage, DispensarySourceProduct do |dsp|
          dsp.dispensary_source.dispensary.admin_user == user
        end
        can :manage, DspPrice do |dsp_price|
          dsp_price.dispensary_source_product.dispensary_source.dispensary.admin_user == user
        end
      end
    end
  end

end