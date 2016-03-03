class HomeOwnersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_home_owner, only: [:show, :edit, :update, :destroy]

  # GET /home_owners
  # GET /home_owners.json
  def index
    @home_owners = HomeOwner.all
  end

  # GET /home_owners/1
  # GET /home_owners/1.json
  def show
  end

  # GET /home_owners/new
  def new
    @home_owner = HomeOwner.new
  end

  # GET /home_owners/1/edit
  def edit
  end

  # POST /home_owners
  # POST /home_owners.json
  def create
    @home_owner = HomeOwner.new(home_owner_params)

    respond_to do |format|
      if @home_owner.save
        format.html { redirect_to admin_path(current_user), notice: 'Home owner was successfully created.' }
        format.json { render :show, status: :created }#, location: @admin }
      else
        # @home_owners = HomeOwner.all
        format.html { render "admin/show", id: current_user }
        format.json { render json: @home_owner.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /home_owners/1
  # PATCH/PUT /home_owners/1.json
  def update
    respond_to do |format|
      if @home_owner.update(home_owner_params)
        format.html { redirect_to admin_path(current_user), notice: 'Home owner was successfully updated.' }
        format.json { render :show, status: :ok }#, location: @admin }
      else
        format.html { render "admin/show", id: current_user  }
        format.json { render json: @home_owner.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /home_owners/1
  # DELETE /home_owners/1.json
  def destroy
    @home_owner.destroy
    respond_to do |format|
      format.html { redirect_to admin_path(current_user), notice: 'Home owner was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_home_owner
      @home_owner = HomeOwner.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def home_owner_params
      params.require(:home_owner).permit(:firstname, :lastname, :email, :phone)
    end
end
