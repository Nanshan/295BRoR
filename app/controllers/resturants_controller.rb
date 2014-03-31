class ResturantsController < ApplicationController
  before_action :set_resturant, only: [:show, :edit, :update, :destroy]

  # GET /resturants
  # GET /resturants.json
  def index
    @category = params[:category]
    @lat = params[:lat].to_f.abs
    @long = params[:long].to_f.abs
    @resturants = Resturant.where(["category = ?", @category]).all
    if (params[:lat] != nil and params[:long] != nil)
      for r in @resturants
        @r_lat = r.latitude.to_f.abs
        @r_long = r.longitude.to_f.abs
        if ((@lat-@r_lat).abs >= 1) or ((@long-@r_long).abs >= 1)
          @resturants.delete(r)
        end
      end
    end
    if (@resturants.length > 3)
      @resturants = @resturants[0..2]
    end
    # order by number of likes?
  end

  # GET /resturants/1
  # GET /resturants/1.json
  def show
  end

  # GET /resturants/new
  def new
    @resturant = Resturant.new
  end

  # GET /resturants/1/edit
  def edit
  end

  # POST /resturants
  # POST /resturants.json
  def create
    @resturant = Resturant.new(name: params[:name], address: params[:address], latitude: params[:latitude], longitude: params[:longitude])
    @resturant.save
  end

  # PATCH/PUT /resturants/1
  # PATCH/PUT /resturants/1.json
  def update
    respond_to do |format|
      if @resturant.update(resturant_params)
        format.html { redirect_to @resturant, notice: 'Resturant was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @resturant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /resturants/1
  # DELETE /resturants/1.json
  def destroy
    @resturant.destroy
    respond_to do |format|
      format.html { redirect_to resturants_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_resturant
      @resturant = Resturant.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def resturant_params
      params.require(:resturant).permit(:name, :address)
    end
end
