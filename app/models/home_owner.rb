class HomeOwner < ActiveRecord::Base
	has_many :issues
	has_many :addresses

  	def fullname
  		# this is not wirking ass it should
  		# [:lastName, :firstName].join(', ')
    	"#{lastname}, #{firstname}"
  	end
end
