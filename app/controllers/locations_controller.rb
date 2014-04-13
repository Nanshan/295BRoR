class LocationsController < ApplicationController
  # GET /locations
  # GET /locations.json
  def index
    @locations = Location.all
        
  end

  # GET /locations/1
  # GET /locations/1.json
  def show
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
end
