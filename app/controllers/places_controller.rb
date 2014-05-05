class PlacesController < ApplicationController

  METERS_IN_MILE = 1609.34

  # recommendation (given type, category, latlong)
  def index
    @type = params[:type].downcase
    @category = params[:category].downcase
    @lat = params[:lat].to_f
    @long = params[:long].to_f
    
    @radius = METERS_IN_MILE * 5
    if (params[:radius] != nil)
      @radius = params[:radius].to_i * METERS_IN_MILE
    end    
    
    @user_id = User.where(["lower(\"userName\") = ?", params[:username].downcase]).first.id

    @places = Place.where("lower(\"locationType\") = ? AND lower(category) = ?", @type, @category).close_to(@lat, @long, @radius)
    @placeHash = Hash.new

    @places.each do |place|
      score = 0
      @likes = History.where("\"placeID\" = ?", place.id)
      @likes.each do |like|
        score += like.like * Similarity.where("user1_id = ? AND user2_id = ?", @user_id, like.userId.to_i).take.similarity
      end
      @placeHash[place] = score
    end

    @places.sort {|x, y| @placeHash[x] <=> @placeHash[y]}

    if (@places.length > 3)
      @places = @places[0..2]
    end
  end

  # search within radius
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
