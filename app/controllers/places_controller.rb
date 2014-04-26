class PlacesController < ApplicationController

  METERS_IN_MILE = 1609.34

  # GET /places
  # GET /places.json
  def index
    @type = params[:type].downcase
    @category = params[:category].downcase
    @lat = params[:lat].to_f
    @long = params[:long].to_f
    
    @radius = METERS_IN_MILE * 5
    if (params[:radius] != nil)
      @radius = params[:radius].to_i * METERS_IN_MILE
    end    
    
    @places = Place.where("lower(\"locationType\") = ? AND lower(category) = ?", @type, @category).close_to(@lat, @long, @radius)
    if (@places.length > 3)
      @places = @places[0..2]
    end
    # order by number of likes?
  end

  # search within 100m
  def near
    @lat = params[:lat].to_f
    @long = params[:long].to_f
    
    @radius = 100
    if (params[:radius] != nil)
      @radius = params[:radius].to_i
    end    
    
    @places = Place.close_to(@lat, @long, @radius)
  end
end
