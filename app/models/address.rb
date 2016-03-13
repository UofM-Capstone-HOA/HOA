class Address < ActiveRecord::Base

  belongs_to :home_owner
  has_many :issues

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

  geocoded_by :full_address
  after_validation :reverse_geocode
  

end
