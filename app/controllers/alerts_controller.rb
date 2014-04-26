class AlertsController < ApplicationController

   ALERT_PERIOD_IN_SECONDS = 900

   # GET /alerts
   def index
     @alert = Array.new
     
     @username = params[:username]
     @user_id = User.where(["lower(\"userName\") = ?", @username.downcase]).first.id
     @events = Location.where(["\"userID\" = ?", @user_id.to_s])
     @radius = 100
     if (params[:radius] != nil)
       @radius = params[:radius].to_i
     end

     @event = @events.pop
     @places = Array.new
     @time_at_location = 0

     if (@event != nil)
       @places = Place.close_to(@event.latitude, @event.longitude, @radius)    

       @last_post_time = @event.created_at
     end

     while (@places.length > 0 and @time_at_location <= ALERT_PERIOD_IN_SECONDS)
       @event = @events.pop
       if (@event != nil)
         @places = Place.close_to(@event.latitude, @event.longitude, @radius) & @places
       else
         break
       end

       @time_at_location = @last_post_time - @event.created_at
     end

     if (@places.length > 0 and @time_at_location >= ALERT_PERIOD_IN_SECONDS)
       @alert = @places
     end
   end
end
