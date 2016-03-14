class AdminController < ApplicationController
	before_action :authenticate_user!
	before_action :is_user_admin 

  def show
  
  	@home_owners = HomeOwner.all
  	@addresses = Address.all
  	@issue_categories = IssueCategory.all

  	@home_owner = HomeOwner.new
  	@address = Address.new
    @issue_category = IssueCategory.new
  
  end

  private

  # function to check if use is admin
  def is_user_admin
    unless current_user.isadmin?
      flash[:notice] =  'You do not have privileges for this page.'
      redirect_to :authenticated_root
    end
  end


end
