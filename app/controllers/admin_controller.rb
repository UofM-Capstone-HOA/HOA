class AdminController < ApplicationController

  def show
  

  	@home_owners = HomeOwner.all
  	@addresses = Address.all
  	@issue_categories = IssueCategory.all

  	@home_owner = HomeOwner.new
  	@address = Address.new

  end


end
