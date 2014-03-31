class AttractionsController < ApplicationController
  before_action :set_attraction, only: [:show, :edit, :update, :destroy]

  # GET /attractions
  # GET /attractions.json
  def index
    @category = params[:category]
    @lat = params[:lat].to_f.abs
    @long = params[:long].to_f.abs
    @attractions = Attraction.where(["category = ?", @category]).all
    if (params[:lat] != nil and params[:long] != nil)
      for r in @attractions
        @r_lat = r.latitude.to_f.abs
        @r_long = r.longitude.to_f.abs
        if ((@lat-@r_lat).abs >= 1) or ((@long-@r_long).abs >= 1)
          @attractions.delete(r)
        end
      end   
    end
    if (@attractions.length > 3)
      @attractions = @attractions[0..2]
    end
    # order by number of likes?
  end

  # GET /attractions/1
  # GET /attractions/1.json
  def show
  end

  # GET /attractions/new
  def new
    @attraction = Attraction.new
  end

  # GET /attractions/1/edit
  def edit
  end

  # POST /attractions
  # POST /attractions.json
  def create
    @attraction = Attraction.new(attraction_params)

    respond_to do |format|
      if @attraction.save
        format.html { redirect_to @attraction, notice: 'Attraction was successfully created.' }
        format.json { render action: 'show', status: :created, location: @attraction }
      else
        format.html { render action: 'new' }
        format.json { render json: @attraction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /attractions/1
  # PATCH/PUT /attractions/1.json
  def update
    respond_to do |format|
      if @attraction.update(attraction_params)
        format.html { redirect_to @attraction, notice: 'Attraction was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @attraction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attractions/1
  # DELETE /attractions/1.json
  def destroy
    @attraction.destroy
    respond_to do |format|
      format.html { redirect_to attractions_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attraction
      @attraction = Attraction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def attraction_params
      params.require(:attraction).permit(:name, :address, :city, :country, :zip, :phone, :price, :rating, :reviews, :latitude, :longitude, :category, :parking)
    end
end