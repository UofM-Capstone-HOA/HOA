class Address < ActiveRecord::Base

  belongs_to :home_owner
  has_many :issues, :dependent => :delete_all

  validates :number, :street, :city, :state, :country, presence: true   
  validates :number, length:  { in: 1..6 }
  validates :number, numericality: true

  validates :street, length: { in: 1..50}
  validates :city, length: { in: 1..30}
  validates :state, length: { in: 1..2} #only accept 2 char state codes
  validates :country, length: { in: 1..20}

  	# will work on this later
 	#  	include Geocoder::Model::Mongoid
	# geocoded_by :full_street_address   
	# after_validation :geocode 

	def full_address
		"#{number} #{street} #{city}, #{state} "
	end

  def self.import(file)
    spreadsheet = Roo::Spreadsheet.open(file, extension: :ods)
    header = spreadsheet.row(1)     
    ActiveRecord::Base.transaction do
      spreadsheet.each(number: 'number', street: 'street', city: "city", state: "state") do |hash|        
        if hash[:number] == "number"
          #puts hash.inspect
        else
          begin      
          Address.create!( number: hash[:number].to_s, street: hash[:street], city: hash[:city], state: hash[:state] )                     
          end          
        end 
      end
    end
  end

  geocoded_by :full_address
  after_validation :geocode
  

end
