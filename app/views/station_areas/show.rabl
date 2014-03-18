object @station_area

node(:type) { "Feature" }

node :geometry do |s|
  { location: [s.latitude, s.longitude],
    type:    "Point" }
end

# List all fields that you want to keep out here
reject_list = %w( location created_at updated_at DK_STATNAM )

# Remove all fields in the reject_list from the array
fields = StationArea.attribute_names.reject { |field| reject_list.include? field }

node :properties do |station|
  Hash[fields.map {|field| [field, station.read_attribute(field)] }]
end