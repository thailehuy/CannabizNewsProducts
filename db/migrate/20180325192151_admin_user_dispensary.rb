class AdminUserDispensary < ActiveRecord::Migration
  def change
    add_column :admin_users, :dispensary_id, :integer
  end
end
