class IssuesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_issue, only: [:show, :edit, :update, :destroy]


  # GET /issues
  # GET /issues.json
  def index
    @issues = Issue.all
    @hash = Gmaps4rails.build_markers(@issues) do |issue, marker|
      marker.lat issue.address.latitude
      marker.lng issue.address.longitude
      marker.infowindow issue.address.full_address + "<br />" + issue.note +
      "<br />" + "Status: " + issue.issue_status_category_id.to_s

      if issue.issue_status_category_id == 1
          marker.picture({
        :url => "/assets/IssueOpen.gif",
        :width => 32,
        :height => 32
        })
      elsif issue.issue_status_category_id == 2
          marker.picture({
        :url => "/assets/IssueResolved.gif",
        :width  => 32,
        :height => 27
        })
      else
          marker.picture({
        :url => "/assets/IssueLien.gif",
        :width  => 32,
        :height => 32
        })
      end
    end
 
  end

  # GET /issues/1
  # GET /issues/1.json
  def show
    index
    @issue_show = Issue.find(params[:id])
    render :index
  end

  def letter
    puts params
    @issue_letter = Issue.find(params[:format])    
  end

  # GET /issues/new
  def new
    @issue = Issue.new
    @issue_date = DateTime.now.strftime('%B %e, %Y')

    # current go for the address

    if params[:lat] and params[:long]
      # 35.171963, -90.051121
      # @addresses = Address.near([params[:lat].to_f, params[:long].to_f], 50.0)
      @addresses = Address.near([ 35.171963, -90.051121], 0.05)
    else
      @addresses = Address.all
    end
    @issue_categories = IssueCategory.all
    @issue_status_categories = IssueStatusCategory.all
  end

  # GET /issues/1/edit
  def edit
    @issue = Issue.find(params[:id])
    @issue_date = DateTime.now.strftime('%B %e, %Y')
    @addresses = Address.all
    @issue_categories = IssueCategory.all
    @issue_status_categories = IssueStatusCategory.all
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
    @issue_show = Issue.where(['address_id = (?) AND issue_category_id = (?)', @issue.address_id, @issue.issue_category_id]).last
    
    respond_to do |format|
        @issue.date = DateTime.now
        @issue.home_owner = @issue.address.home_owner
        if not @issue.home_owner
          @issue.home_owner = HomeOwner.find(1)
        end
        @issue.user = current_user
        
        if @issue_show.present? and params[:commit] != 'Create Anyway'
          
          @addresses = Address.all
          @issue_categories = IssueCategory.all
          @issue_status_categories = IssueStatusCategory.all
          @issue_date = DateTime.now.strftime('%B %e, %Y')
          format.html{ render :new }
          
        elsif @issue.save 
          format.html { redirect_to issues_path(), notice: 'Issue was successfully created.' }
          format.json { render :index, issue_status_category_id: :created, location: @issue}
        else
          @issue = Issue.new
          @issue_date = DateTime.now.strftime('%B %e, %Y')
          if params[:lat] and params[:long]
            @addresses = Address.near([params[:lat].to_f, params[:long].to_f], 5)
          else
            @addresses = Address.all
          end
          @issue_categories = IssueCategory.all
          @issue_status_categories = IssueStatusCategory.all
          flash[:alert] = "Please fill out the entire form."
          format.html { render :new }
          # format.json { render json: @issue.errors, issue_status_category_id: :unprocessable_entity }
        end
    end
  end

  # def close
  #   @issue = Issue.find([:id])
  #   @issue.resolved = params[:resolved]
  #   @issue.save!
  #   renser :index
  # end

  # PATCH/PUT /issues/1
  # PATCH/PUT /issues/1.json
  def update
    # params[:issue] = @issue
    respond_to do |format|
      puts params.inspect 
      puts @issue.id
      if @issue.update(issue_params)
        format.html { redirect_to issues_path(), notice: 'Issue was successfully updated.' }
        format.json { render :index, issue_status_category_id: :ok }
      else
        format.html { render :edit }
        format.json { render json: @issue.errors, issue_status_category_id: :unprocessable_entity }
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


  def map
    @issues = Issue.all
    @hash = Gmaps4rails.build_markers(@issues) do |issue, marker|
      marker.lat issue.address.latitude
      marker.lng issue.address.longitude
      marker.infowindow issue.address.full_address + "<br />" + issue.note +
      "<br />" + "Status: " + issue.issue_status_category_id.to_s

      if issue.issue_status_category_id == 1
          marker.picture({
        :url => "/assets/IssueOpen.gif",
        :width => 32,
        :height => 32
        })
      elsif issue.issue_status_category_id == 2
          marker.picture({
        :url => "/assets/IssueResolved.gif",
        :width  => 32,
        :height => 27
        })
      else
          marker.picture({
        :url => "/assets/IssueLien.gif",
        :width  => 32,
        :height => 32
        })
      end
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
      {pictures: []},            
      :address_id,
      :home_owner_id, 
      :issue_category_id,
      :issue_status_category_id
    )
    end

end
