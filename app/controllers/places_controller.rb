class PlacesController < ApplicationController
  # GET /places
  # GET /places.json
  def index
    @type = params[:type].downcase
    @category = params[:category].downcase
    @lat = params[:lat].to_f.abs
    @long = params[:long].to_f.abs
    @places = Place.where("lower(\"locationType\") = ? AND lower(category) = ?", @type, @category).all
#    if (params[:lat] != nil and params[:long] != nil)
#      for r in @places
#        @r_lat = r.latitude.to_f.abs
#        @r_long = r.longitude.to_f.abs
#        if ((@lat-@r_lat).abs >= 1) or ((@long-@r_long).abs >= 1)
#          @places.delete(r)
#        end
#      end
#    end
    if (@places.length > 3)
      @places = @places[0..2]
    end
    # order by number of likes?
  end

  # GET /places/1
  # GET /places/1.json
  def show
  end
end
