class AlertsController < ApplicationController

   15_MINUTES = 900

   # GET /alerts
   def index
     @alert = "No Alert"
     
     @username = params[:username]
     @user_id = User.where(["lower(\"userName\") = ?", @username.downcase]).first.id
     @events = Location.where(["userID = ?", @user_id])
     @radius = 100
     if (params[:radius] != nil)
       @radius = params[:radius].to_i
     end

     @event = @events.pop
     @places = Array.new

     if (@event != nil)
       @places = Place.close_to(@event.latitude, @event.longitude, @radius)    
     end

     @last_post_time = @event.created_at
     @time_at_location = 0

     while (@places.length > 0 and @time_at_location <= 15_MINUTES)
       @event = @events.pop
       if (@event != nil)
         @places = Place.close_to(@event.latitude, @event.longitude, @radius) & @places
       else
         break
       end

       @time_at_location = @event.created_at - @last_post_time
     end

     if (@places.length > 0 and @time_at_location >= 15_MINUTES)
       @alert = @places
     end
   end
end
