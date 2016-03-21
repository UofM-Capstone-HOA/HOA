class AddressesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_address, only: [:show, :edit, :update, :destroy]

  # GET /addresses
  # GET /addresses.json
  def index
    @addresses = Address.all
  end

  # GET /addresses/1
  # GET /addresses/1.json
  def show
    
  end

  # GET /addresses/new
  def new
    @address = Address.new
  end

  # GET /addresses/1/edit
  def edit
    @home_owners = HomeOwner.all
  end

  # POST /addresses
  # POST /addresses.json

  def create    
    @address = Address.new(address_params)

    respond_to do |format|
      if @address.save
        format.html { redirect_to admin_path(current_user), notice: 'Address was successfully created.' }
        format.json { render :show, status: :created, location: @address }
      else
        format.html { render :new }
        format.json { render json: @address.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /addresses/1
  # PATCH/PUT /addresses/1.json
  def update
    respond_to do |format|
      if @address.update(address_params)
        format.html { redirect_to admin_path(current_user), notice: 'Address was successfully updated.' }
        format.json { render :show, status: :ok, location: @address }
      else
        format.html { render admin_path(current_user), error: 'Issue.' }
        format.json { render json: @address.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /addresses/1
  # DELETE /addresses/1.json
  def destroy
    @address.destroy
    respond_to do |format|
      format.html { redirect_to admin_path(current_user), notice: 'Address was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def address_modal
    @address = set_address(:id)
    # @user_list = User.all
    # respond_to do |format|
    #   format.js
    # end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_address
      @address = Address.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def address_params
      params.require(:address).permit(:number, 
            :street, 
            :city, 
            :state, 
            :home_owner_id,
            :latitude,
            :longitude,
            :full_address
            )
    end
end
