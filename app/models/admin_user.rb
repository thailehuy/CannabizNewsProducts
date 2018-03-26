class AdminUser < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable
         
  #connect to dispensary
  belongs_to :dispensary
  has_one :dispensary
  
  #after create, create a DispensarySource record with source - Dispensary (similar to weedmaps, leafly record)
  #copy info from weedmaps and leafly record to this one
  #use this dispensarysource for everything else - the dsp products and such
end
