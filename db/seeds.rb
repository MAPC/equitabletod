# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'

# service_types = ['bus', 'commuter rail', 'subway', 'bus rapid transit']
# service_types.each { |type| ServiceType.create(mode: type.titleize) }


# bus    = ServiceType.find_by_mode('Bus')
# subway = ServiceType.find_by_mode('Subway')
# mbcr   = ServiceType.find_by_mode('Commuter Rail')
# silver = ServiceType.find_by_mode('Bus Rapid Transit')


# %w( 1 47 69 89 ).each {|route| bus.transit_lines.create(name: "#{route}") }


# ['red', 'green', 'blue', 'orange', 'green'].each do |color|
#   subway.transit_lines.create(name: "#{color} Line".titleize)
# end


# [ 'Framingham/Worcester',
#   'Fitchburg',
#   'Newburyport/Rockport',
#   'Lowell',
#   'Providence/Stoughton',
#   'Haverill'].each do |line|
#     mbcr.transit_lines.create(name: "#{line} Line".titleize)
#   end


# %w( 1 2 3 4 5 ).each {|route| silver.transit_lines.create(name: "SL#{route}") }



# some   = (12..35).to_a
# scores = (0..100).to_a

# def range (min, max)
#   rand * (max-min) + min
# end

# TransitLine.all.each do |transit_line|

#   some.sample.times do
#     transit_line.station_areas.create( location:      "#{range(40,43)}, #{range(70,73)}",
#                                       etod_score:   scores.sample,
#                                       station_name: Faker::Address.street_address,
#                                       transit_commute_share:  rand * 100,
#                                       transportation_ghgs:    rand * 100_000,
#                                       vehicle_miles_traveled: rand * 100_000,
#                                       vehicle_ownership:      rand * 100 )
#   end
# end

def dictionary_entries
 DictionaryEntry.destroy_all
 ActiveRecord::Base.connection.reset_pk_sequence!("dictionary_entries")
 CSV.foreach('db/fixtures/dict.csv', :headers => true) do |csv_obj|
   code             = csv_obj['code']
   description      = csv_obj['description']
   importance       = csv_obj['importance']
   interpretation   = csv_obj['interpretation']
   name             = csv_obj['name']
   technical_notes  = csv_obj['technical_notes']
   order            = csv_obj['order']
   
   record = DictionaryEntry.create(code: code, description: description, importance: importance, interpretation: interpretation, name: name, technical_notes: technical_notes, order: order)
   record.save!
   puts record.id
  end
end

def transit_lines
  TransitLine.destroy_all
  ActiveRecord::Base.connection.reset_pk_sequence!("transit_lines")
  CSV.foreach('db/fixtures/transit_lines.csv', :headers => true) do |csv_obj|
    name          = csv_obj['name']
    service_type  = csv_obj['service_type']

    record = TransitLine.create(name: name, service_type: service_type)
    record.save!
  end
end
def station_areas
  StationArea.destroy_all
  ActiveRecord::Base.connection.reset_pk_sequence!("station_areas")
  copy_filedata("#{Rails.root}/db/fixtures/station_areas_14_05_27.csv", :station_areas)
end

def station_areas_transit_lines_crosswalk
  ActiveRecord::Base.connection.reset_pk_sequence!("station_areas_transit_lines")
  copy_filedata("#{Rails.root}/db/fixtures/station_areas_transit_lines.csv", :station_areas_transit_lines)
end

dictionary_entries
transit_lines
station_areas
station_areas_transit_lines_crosswalk

