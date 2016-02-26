class StaticPagesController < ApplicationController
	helper_method :resource_name, :resource, :devise_mapping

  def welcome
    
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

  before_action :authenticate_user!

	def home

	end

	
end
