class Dispensary < ActiveRecord::Base

    #has_many :dispensary_photos --> not using right now
    
    belongs_to :state
    validates :name, presence: true, length: {minimum: 1, maximum: 300}
    
    #admin
    has_one :admin_user
    belongs_to :admin_user
    # scope :mine, -> { 
    #     AdminUser.where(:id => @current_admin_user.id).dispensaries.first
    # }
    
    #many to many with dispensary sources
    has_many :dispensary_sources
    has_many :sources, through: :dispensary_sources
    
    #geocode location
    geocoded_by :location
    after_validation :geocode
    
    #friendly url
    extend FriendlyId
    friendly_id :name, use: :slugged
    
    #photo aws storage
    mount_uploader :image, PhotoUploader
    
    #import CSV file
    def self.import_via_csv(file)
        CSV.foreach(file.path, headers: true) do |row|
            Dispensary.create! row.to_hash
        end
    end
    
    #export CSV file
    def self.to_csv
        CSV.generate do |csv|
            csv << column_names
            all.each do |dispensary|
                csv << dispensary.attributes.values_at(*column_names)
            end
        end
    end
    
    #delete relations
    before_destroy :delete_relations
    def delete_relations
       self.dispensary_sources.destroy_all
    end
    
    
end #end dispensary class