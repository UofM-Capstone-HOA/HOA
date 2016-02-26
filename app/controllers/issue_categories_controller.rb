class IssueCategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_issue_category, only: [:show, :edit, :update, :destroy]

  # GET /issue_categories
  # GET /issue_categories.json
  def index
    @issue_categories = IssueCategory.all

  end

  # GET /issue_categories/1
  # GET /issue_categories/1.json
  def show
    @issue_category = IssueCategory.find(params[:id])

  end

  # GET /issue_categories/new
  def new
    @issue_category = IssueCategory.new
  end

  # GET /issue_categories/1/edit
  def edit
    #@issue_category = IssueCategory.find(params[:id])
  end

  # POST /issue_categories
  # POST /issue_categories.json
  def create
    @issue_category = IssueCategory.new(issue_category_params)

    respond_to do |format|
      if @issue_category.save
        format.html { redirect_to admin_path(current_user), notice: 'Issue category was successfully created.' }
        format.json { render :show, status: :created, location: @issue_category }
      else
        format.html { render admin_path(current_user) }
        format.json { render json: @issue_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /issue_categories/1
  # PATCH/PUT /issue_categories/1.json
  def update
    respond_to do |format|
      if @issue_category.update(issue_category_params)
        format.html { redirect_to admin_path(current_user), notice: 'Issue category was successfully updated.' }
        format.json { render :show, status: :ok, location: @issue_category }
      else
        format.html { render admin_path(current_user) }
        format.json { render json: @issue_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /issue_categories/1
  # DELETE /issue_categories/1.json
  def destroy
    @issue_category.destroy
    respond_to do |format|
      format.html { redirect_to admin_path(current_user), notice: 'Issue category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_issue_category
      @issue_category = IssueCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def issue_category_params
      params.require(:issue_category).permit(:name)
    end
end
