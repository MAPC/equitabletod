object false
node(:type) { "FeatureCollection" }

child @station_areas => :features do
  extends 'station_areas/show'  
end

