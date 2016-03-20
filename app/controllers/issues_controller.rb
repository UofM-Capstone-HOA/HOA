class IssuesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_issue, only: [:show, :edit, :update, :destroy]


  # GET /issues
  # GET /issues.json
  def index
    @issues = Issue.all
  end

  # GET /issues/1
  # GET /issues/1.json
  def show
    @issue_show = Issue.find(params[:id])

  end

  # GET /issues/new
  def new
    @issue = Issue.new
    @issue_date = DateTime.now.strftime('%B %e, %Y')

    # current go for the address
    @addresses = Address.all
    @issue_categories = IssueCategory.all
  end

  # GET /issues/1/edit
  def edit
    @issue = Issue.find(params[:id])
    @issue_date = DateTime.now.strftime('%B %e, %Y')
    @addresses = Address.all
    @issue_categories = IssueCategory.all
  end

  # def show_dup
  #   format.js { render :coffee => "open_mod()" }
  # end

  # POST /issues
  # POST /issues.json
  def create
    @issue = Issue.new(issue_params)

    # store a possible duplicate
    # Currently not checking a date range but any possible
    @issue_show = Issue.where(['address_id = (?) AND issue_category_id = (?) AND resolved = false', @issue.address_id, @issue.issue_category_id]).last
    
    respond_to do |format|
        @issue.date = DateTime.now
        @issue.home_owner = @issue.address.home_owner
        @issue.user = current_user
        
        if @issue_show.present? and params[:commit] != 'Create Anyway'
          
          @addresses = Address.all
          @issue_categories = IssueCategory.all
          @issue_date = DateTime.now.strftime('%B %e, %Y')
          format.html{ render :new }
          
        elsif @issue.save! 
          format.html { redirect_to issues_path(), notice: 'Issue was successfully created.' }
          format.json { render :index, status: :created, location: @issue}
        else
          format.html { render :new }
          format.json { render json: @issue.errors, status: :unprocessable_entity }
        end
    end
  end

  # PATCH/PUT /issues/1
  # PATCH/PUT /issues/1.json
  def update
    respond_to do |format|
      if @issue.update(issue_params)
        format.html { redirect_to issues_path(), notice: 'Issue was successfully updated.' }
        format.json { render :index, status: :ok }
      else
        format.html { render :edit }
        format.json { render json: @issue.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /issues/1
  # DELETE /issues/1.json
  def destroy
    @issue.destroy
    respond_to do |format|
      format.html { redirect_to issues_url, notice: 'Issue was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_issue
      @issue = Issue.find(params[:id])
    end    

    # Never trust parameters from the scary internet, only allow the white list through.
    def issue_params
      # params[:issue]
      params.require(:issue).permit(
      :date,
      :note,
      :picture,
      :lien,
      :resolved,
      :address_id,
      :home_owner_id, 
      :issue_category_id
    )
    end

end
