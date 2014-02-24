class AlertsController < ApplicationController

   # GET /alerts
   def index
     @user_id = params[:userID]
     @events = Location.where(["userID = ?", @user_id]).last(4)
     @alert = "No Alert"
     if (@evenets.length <3)
        @alert = "No Alert"
     elsif (@events.length == 3)
       @lat = @events[0].latitude
       @long = @events[0].longitude
       if (@lat == @events[1].latitude && @lat == @events[2].latitude && @long == @events[1].longitude && @long == @events[2].longitude)
         @alert = "Alert"
       end
      else
        if (@lat == @events[1].latitude && @lat == @events[2].latitude && @long == @events[1].longitude && @long == @events[2].longitude && @lat == @events[3].latitude && @long == @events[3].longitude)
        @alert = "No Alert"
        elsif (@events[1].latitude == @events[2].latitude && @events[2].latitude == @events[3].latitude && @events[1].longitude == @events[2].longitude && @events[2].longitude == @events[3].longitude)
           @alert = "Alert"
        else
           @alert = "no alert"

     end
     
     # find 3 most recent events in Location table for this user_id
     # if all 3 have same location
     # then get the restaurant at that location
     # and return the alert
     #
     # else (not have 3 most recent events having same location which means user has not been there 15 minutes or maybe user left)
     # return no alert
   end

end
