class DispensaryAdminToDispensary < ActiveRecord::Migration
  def change
    add_column :dispensary_admin_users, :dispensary_id, :integer
  end
end
