class ParksController < ApplicationController
  before_action :set_park, only: [:show, :edit, :update, :destroy]

  # GET /parks
  # GET /parks.json
  def index
    @category = params[:category]
    @lat = params[:lat].to_f.abs
    @long = params[:long].to_f.abs
    @parks = Park.where(["category = ?", @category]).all
    if (params[:lat] != nil and params[:long] != nil)
      for r in @parks
        @r_lat = r.latitude.to_f.abs
        @r_long = r.longitude.to_f.abs
        if ((@lat-@r_lat).abs >= 1) or ((@long-@r_long).abs >= 1)
          @parks.delete(r)
        end
      end
    end
    if (@parks.length > 3)
      @parks = @parks[0..2]
    end
    # order by number of likes?
  end

  # GET /parks/1
  # GET /parks/1.json
  def show
  end

  # GET /parks/new
  def new
    @park = Park.new
  end

  # GET /parks/1/edit
  def edit
  end

  # POST /parks
  # POST /parks.json
  def create
    @park = Park.new(park_params)

    respond_to do |format|
      if @park.save
        format.html { redirect_to @park, notice: 'Park was successfully created.' }
        format.json { render action: 'show', status: :created, location: @park }
      else
        format.html { render action: 'new' }
        format.json { render json: @park.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /parks/1
  # PATCH/PUT /parks/1.json
  def update
    respond_to do |format|
      if @park.update(park_params)
        format.html { redirect_to @park, notice: 'Park was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @park.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /parks/1
  # DELETE /parks/1.json
  def destroy
    @park.destroy
    respond_to do |format|
      format.html { redirect_to parks_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_park
      @park = Park.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def park_params
      params.require(:park).permit(:name, :address, :city, :country, :zip, :phone, :price, :rating, :reviews, :latitude, :longitude, :parking)
    end
end