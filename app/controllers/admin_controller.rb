class AdminController < ApplicationController
	before_action :authenticate_user!
  def show
  	@home_owners = HomeOwner.all
  	@addresses = Address.all
  	@issue_categories = IssueCategory.all

  	@home_owner = HomeOwner.new
  	@address = Address.new
    @issue_category = IssueCategory.new
  	
  end

  def show_ic
 	show
  	@issue_category_show = IssueCategory.find(params[:issue_category_show])
  	render :show, id: current_user 
  end


end
