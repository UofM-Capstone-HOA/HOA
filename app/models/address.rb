class Address < ActiveRecord::Base
  belongs_to :home_owner
  has_many :issues

  	# will work on this later
 	#  	include Geocoder::Model::Mongoid
	# geocoded_by :full_street_address   
	# after_validation :geocode 

	def full_address
		"#{name} #{street} #{city}, #{state} "
	end
end
