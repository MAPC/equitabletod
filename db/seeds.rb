# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'CSV'

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

def transit_lines
  TransitLine.destroy_all
  ActiveRecord::Base.connection.reset_pk_sequence!("transit_lines")
  CSV.foreach('db/fixtures/transit_lines.csv', :headers => true) do |csv_obj|
    name = csv_obj['name']
    service_type = csv_obj['service_type']

    record = TransitLine.create(name: name, service_type: service_type)
    record.save!
    
  end
end

transit_lines
