class Source < ActiveRecord::Base

    has_many :articles
    
    validates :name, presence: true, length: { minimum: 3, maximum: 25 }
    validates_uniqueness_of :name
    
    #import CSV file
    def self.import(file)
        CSV.foreach(file.path, headers: true) do |row|
            Source.create! row.to_hash
        end
    end
    
    #export CSV file
    def self.to_csv
        CSV.generate do |csv|
            csv << column_names
            all.each do |source|
                csv << source.attributes.values_at(*column_names)
            end
        end
    end
end