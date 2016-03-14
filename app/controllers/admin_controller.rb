class AdminController < ApplicationController
	before_action :authenticate_user!
	# before_action :redirect_to_root

  def show
  
  	@home_owners = HomeOwner.all
  	@addresses = Address.all
  	@issue_categories = IssueCategory.all

  	@home_owner = HomeOwner.new
  	@address = Address.new
    @issue_category = IssueCategory.new
  
  end


end
