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
    @issue = Issue.find(params[:id])

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
  end

  # POST /issues
  # POST /issues.json
  def create
    @issue = Issue.new(issue_params)

    respond_to do |format|
      @issue.date = DateTime.now
      @issue.home_owner = @issue.address.home_owner
      @issue.user = current_user
      if @issue.save!
        format.html { redirect_to issues_path(), notice: 'Issue was successfully created.' }
        format.json { render :show, status: :created, location: @issue }
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
        format.html { redirect_to @issue, notice: 'Issue was successfully updated.' }
        format.json { render :show, status: :ok, location: @issue }
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
      :address_id,
      :home_owner_id, 
      :issue_category_id
    )
    end
end
