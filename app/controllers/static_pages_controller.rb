class StaticPagesController < ApplicationController
	helper_method :resource_name, :resource, :devise_mapping

	def home
	end

	def welcome
		re
	end
	

  	def resource_name
    	:user
  	end
 
  	def resource
    	@resource ||= User.new
  	end
 
  	def devise_mapping
   	 @devise_mapping ||= Devise.mappings[:user]
  	end
end