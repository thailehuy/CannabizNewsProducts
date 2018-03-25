class RoleToDispAdmin < ActiveRecord::Migration
  def change
    add_column :dispensary_admin_users, :role, :integer
  end
end
