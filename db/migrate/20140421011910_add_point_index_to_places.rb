class AddPointIndexToPlaces < ActiveRecord::Migration
  def up
    execute %{
      create index index_on_places_location ON places using gist (
        ST_GeographyFromText(
          'SRID=4326;POINT(' || places.longitude || ' ' || places.latitude || ')'
        )
      )
    }
  end

  def down
    execute %{drop index index_on_places_location}
  end
end
