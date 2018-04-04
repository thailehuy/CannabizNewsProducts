class AdminUser < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable
         
  #connect to dispensary
  belongs_to :dispensary
  has_one :dispensary
  
  after_save :create_dispensary_source
  def create_dispensary_source
    if self.role != 99 && self.dispensary_id.present?
      dsp_source = DispensarySource.where(dispensary_id: self.dispensary_id).
                    order('last_menu_update DESC').first
      source = Source.where(name: 'Self').where(source_type: 'Dispensary').first
      cloned_dsp_source = dsp_source.clone
      cloned_dsp_source.dispensary_id = self.dispensary_id
      cloned_dsp_source.source_id = source.id
      
      unless cloned_dsp_source.save
        puts "Dispensary Source Error: #{cloned_dsp_source.errors.messages}"
      end
    end
  end
end
