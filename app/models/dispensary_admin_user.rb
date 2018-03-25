class DispensaryAdminUser < ActiveRecord::Base
  role_based_authorizable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable
         
  
  #connect to dispensary
  belongs_to :dispensary
end
