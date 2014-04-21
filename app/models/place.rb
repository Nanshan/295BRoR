class Place < ActiveRecord::Base

  # credit github.com/ngauthier for below logic
  def self.close_to(latitude, longitude, distance_in_meters = 2000)
    where(%{
      ST_DWithin(
        ST_GeographyFromText(
          'SRID=4326;POINT(' || places.longitude || ' ' || places.latitude || ')'
        ),
        ST_GeographyFromText('SRID=4326;POINT(%f %f)'),
        %d
      )
    } % [longitude, latitude, distance_in_meters])
  end
end
