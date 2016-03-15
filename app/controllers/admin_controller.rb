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

  # These functions control the modal creation
  def show_ic
 	show
  	@issue_category_show = IssueCategory.find(params[:issue_category_show])
  	render :show, id: current_user 
  end

  def edit_ic
 	show
  	@issue_category = IssueCategory.find(params[:issue_category_edit])
  	render :show, id: current_user 
  end

  def show_ho
  show
    @home_owner_show = HomeOwner.find(params[:home_owner_show])
    render :show, id: current_user 
  end

  def edit_ho
    show
    @home_owner = HomeOwner.find(params[:home_owner_edit])
    render :show, id: current_user 
  end

  def show_address
    show
    @address_show = Address.find(params[:address_show])
    render :show, id: current_user 
  end

  def edit_address
    show
    @address = Address.find(params[:address_edit])
    render :show, id: current_user 
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
