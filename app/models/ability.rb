class Ability
  include CanCan::Ability

  def initialize(user)

    can :read, :all # permissions for every user, even if not logged in

    if user.present?
      if user.is_admin?
        can :manage, :all
      else
        can :read, ActiveAdmin::Page, name: "Dashboard", namespace_name: "dispensary_admin"
        #can :manage, DispensarySourceProduct
        #can :manage, DspPrice
        can :read, Product
        can :manage, AdminUser, id: user.id

        #need to set the adminuser id on dispensary table
        can :manage, Dispensary, {admin_user_id: user.id}
        can :manage, DispensarySourceProduct, {dispensary_source: {dispensary: {admin_user_id: user.id}}}
        can :manage, DspPrice, {dispensary_source_product: {dispensary_source: {dispensary: {admin_user_id: user.id}}}}
      end
    end
  end

end