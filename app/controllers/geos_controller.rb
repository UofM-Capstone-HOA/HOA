class GeosController < ApplicationController
  before_action :set_geo, only: [:show, :edit, :update, :destroy]

  # GET /geos
  # GET /geos.json
  def index
    @geos = Geo.all
  end

  # GET /geos/1
  # GET /geos/1.json
  def show
  end

  # GET /geos/new
  def new
    @geo = Geo.new
  end

  # GET /geos/1/edit
  def edit
  end

  # POST /geos
  # POST /geos.json
  def create
    @geo = Geo.new(geo_params)

    respond_to do |format|
      if @geo.save
        format.html { redirect_to @geo, notice: 'Geo was successfully created.' }
        format.json { render :show, status: :created, location: @geo }
      else
        format.html { render :new }
        format.json { render json: @geo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /geos/1
  # PATCH/PUT /geos/1.json
  def update
    respond_to do |format|
      if @geo.update(geo_params)
        format.html { redirect_to @geo, notice: 'Geo was successfully updated.' }
        format.json { render :show, status: :ok, location: @geo }
      else
        format.html { render :edit }
        format.json { render json: @geo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /geos/1
  # DELETE /geos/1.json
  def destroy
    @geo.destroy
    respond_to do |format|
      format.html { redirect_to geos_url, notice: 'Geo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_geo
      @geo = Geo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def geo_params
      params.require(:geo).permit(:address, :latitude, :longitude)
    end
end
