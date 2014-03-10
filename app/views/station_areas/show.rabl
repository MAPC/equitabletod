object @station_area

node :type do ; "Feature" ; end

node :geometry do |s|
  attributes location: s.location.split.map{|e| e.to_f},
             type:    "Point"
end

node :properties do |s|
  attributes etod_score: s.etod_score,
             station_name: s.station_name
end