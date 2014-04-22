class LocationsController < ApplicationController

  # exposed for ease of testing only
  def index
    @locations = Location.order("id").page(params[:page]).per(50)        
  end

  def create
    @user_id = User.where(["\"userName\" = ?", params[:username]]).first.id
    @location = Location.new(latitude: params[:latitude], longitude: params[:longitude], userID: @user_id) 
    @location.save     
  end

end
