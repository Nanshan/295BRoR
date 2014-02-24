class LocationsController < ApplicationController
  before_action :set_location, only: [:show, :edit, :update, :destroy]

  # GET /locations
  # GET /locations.json
  def index
    @locations = Location.all
  end

  # GET /locations/1
  # GET /locations/1.json
  def show
  end

  # GET /locations/new
  def new
    @location = Location.new
  end

  # GET /locations/1/edit
  def edit
  end

  # POST /locations
  # POST /locations.json
  def create
     #@resturant =  Resturant.find_by(latitude:  params[:latitude], longitude: params[:longitude]) 
     #if @resturant != nil
         @location = Location.new(latitude: params[:latitude], longitude: params[:longitude], userID: params[:userID]) 
         @location.save
      #end
  end
 
  def alert
     @user_id = params[:userID]
     # find 3 most recent events in Location table for this user_id
     # if all 3 have same location
     # then get the restaurant at that location
     # and return the alert
     #
     # else (not have 3 most recent events having same location which means user has not been there 15 minutes or maybe user left)
     # return no alert
  end

  # PATCH/PUT /locations/1
  # PATCH/PUT /locations/1.json
  def update
  end

  # DELETE /locations/1
  # DELETE /locations/1.json
  def destroy
    @location.destroy
    respond_to do |format|
      format.html { redirect_to locations_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_location
      @location = Location.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def location_params
      params.require(:location).permit(:latitude, :longtitude)
    end
end
