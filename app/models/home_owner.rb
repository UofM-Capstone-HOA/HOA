class HomeOwner < ActiveRecord::Base
	# added this not 100%
	has_many :issues

  	def self.fullname
  		# this is not wirking ass it should
  		[:lastName, :firstName].join(', ')
    	# "#{lastName}, #{firstName}"
  	end
end
