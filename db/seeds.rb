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

def dictionary_entries
  DictionaryEntry.destroy_all
  ActiveRecord::Base.connection.reset_pk_sequence!("dictionary_entries")
  CSV.foreach('db/fixtures/dict.csv', :headers => true) do |csv_obj|
    code = csv_obj['code']
    description = csv_obj['description']
    importance = csv_obj['importance']
    interpretation = csv_obj['interpretation']
    name = csv_obj['name']
    technical_notes = csv_obj['technical_notes']
    order = csv_obj['order']
    
    record = DictionaryEntry.create(code: code, description: description, importance: importance, interpretation: interpretation, name: name, technical_notes: technical_notes, order: order)
    record.save!
    
  end
end

def station_areas
  StationArea.destroy_all
  ActiveRecord::Base.connection.reset_pk_sequence!("station_areas")
  CSV.foreach('db/fixtures/station_areas_230514.csv', :headers => true) do |csv_obj|
    name =   csv_obj['name']
    muni_name = csv_obj['muni_name']
    muni_id = csv_obj['muni_id']
    latitude = csv_obj['latitude']
    longitude = csv_obj['longitude']
    community_type_id = csv_obj['community_type_id']
    community_type_description = csv_obj['community_type_description']
    subcommunity_type_id = csv_obj['subcommunity_type_id']
    subcommunity_type_description = csv_obj['subcommunity_type_description']
    station_class = csv_obj['station_class']
    ov_area = csv_obj['ov_area']
    ex_area = csv_obj['ex_area']
    ex_aval = csv_obj['ex_aval']
    ov_aval = csv_obj['ov_aval']
    ov_comac = csv_obj['ov_comac']
    ex_comac = csv_obj['ex_comac']
    ov_compc = csv_obj['ov_compc']
    ov_comprk = csv_obj['ov_comprk']
    ex_comprk = csv_obj['ex_comprk']
    ov_dvothac = csv_obj['ov_dvothac']
    ex_dvothac = csv_obj['ex_dvothac']
    ov_dvothpc = csv_obj['ov_dvothpc']
    ov_dvotprk = csv_obj['ov_dvotprk']
    ex_dvotprk = csv_obj['ex_dvotprk']
    ov_ed_att = csv_obj['ov_ed_att']
    ov_emp10 = csv_obj['ov_emp10']
    ex_emp10 = csv_obj['ex_emp10']
    ov_empcons = csv_obj['ov_empcons']
    ex_empcons = csv_obj['ex_empcons']
    ov_empden = csv_obj['ov_empden']
    ov_empplan = csv_obj['ov_empplan']
    ex_empplan = csv_obj['ex_empplan']
    ov_est_10 = csv_obj['ov_est_10']
    ex_est_10 = csv_obj['ex_est_10']
    ov_far = csv_obj['ov_far']
    ov_ghg = csv_obj['ov_ghg']
    ex_ghg = csv_obj['ex_ghg']
    ov_hh10 = csv_obj['ov_hh10']
    ex_hh10 = csv_obj['ex_hh10']
    ov_hhnocar = csv_obj['ov_hhnocar']
    ov_hhinc = csv_obj['ov_hhinc']
    ov_hresac = csv_obj['ov_hresac']
    ex_hresac = csv_obj['ex_hresac']
    ov_hrespc = csv_obj['ov_hrespc']
    ov_hrspkac = csv_obj['ov_hrspkac']
    ex_hrspkac = csv_obj['ex_hrspkac']
    ov_hu10 = csv_obj['ov_hu10']
    ex_hu10 = csv_obj['ex_hu10']
    ov_hu_0010 = csv_obj['ov_hu_0010']
    ex_hu_0010 = csv_obj['ex_hu_0010']
    ov_hucons = csv_obj['ov_hucons']
    ex_hucons = csv_obj['ex_hucons']
    ov_hupac = csv_obj['ov_hupac']
    ov_huplan = csv_obj['ov_huplan']
    ex_huplan = csv_obj['ex_huplan']
    ov_intnpac = csv_obj['ov_intnpac']
    ov_intntot = csv_obj['ov_intntot']
    ov_jobacc = csv_obj['ov_jobacc']
    ov_lresac = csv_obj['ov_lresac']
    ex_lresac = csv_obj['ex_lresac']
    ov_lrespc = csv_obj['ov_lrespc']
    ov_mix = csv_obj['ov_mix']
    ov_pct_abc = csv_obj['ov_pct_abc']
    ov_pcttran = csv_obj['ov_pcttran']
    ov_pop_0010 = csv_obj['ov_pop_0010']
    ex_pop_0010 = csv_obj['ex_pop_0010']
    ov_pop10 = csv_obj['ov_pop10']
    ex_pop10 = csv_obj['ex_pop10']
    ex_prkac = csv_obj['ex_prkac']
    ov_prkac = csv_obj['ov_prkac']
    ov_prkpc = csv_obj['ov_prkpc']
    ov_rentocc = csv_obj['ov_rentocc']
    ov_respc = csv_obj['ov_respc']
    ov_taxrev = csv_obj['ov_taxrev']
    ex_taxrev = csv_obj['ex_taxrev']
    ov_trnpcmi = csv_obj['ov_trnpcmi']
    ov_vacdvac = csv_obj['ov_vacdvac']
    ex_vacdvac = csv_obj['ex_vacdvac']
    ov_vacdvpc = csv_obj['ov_vacdvpc']
    ov_vacunac = csv_obj['ov_vacunac']
    ov_vacunpc = csv_obj['ov_vacunpc']
    ov_vehphh = csv_obj['ov_vehphh']
    ov_vmthday = csv_obj['ov_vmthday']
    phase = csv_obj['phase']
    mapc = csv_obj['mapc']
    walkscore = csv_obj['walkscore']
    etod_q0car = csv_obj['etod_q0car']
    etod_q25k = csv_obj['etod_q25k']
    etod_qabc = csv_obj['etod_qabc']
    etod_qaff = csv_obj['etod_qaff']
    etod_qdens = csv_obj['etod_qdens']
    etod_qgrav = csv_obj['etod_qgrav']
    etod_qrent = csv_obj['etod_qrent']
    etod_qtas = csv_obj['etod_qtas']
    etod_qtci = csv_obj['etod_qtci']
    etod_qwalk = csv_obj['etod_qwalk']
    etod_sub1t = csv_obj['etod_sub1t']
    etod_sub2o = csv_obj['etod_sub2o']
    etod_sub3d = csv_obj['etod_sub3d']
    etod_total = csv_obj['etod_total']
    etod_type = csv_obj['etod_type']
    created_at = csv_obj['created_at']
    updated_at = csv_obj['updated_at']
    line_descr = csv_obj['line_descr']
    
    record = StationArea.create((name: name, muni_name: muni_name, muni_id: muni_id, latitude: latitude, longitude: longitude, community_type_id: community_type_id, community_type_description: community_type_description, subcommunity_type_id: subcommunity_type_id, subcommunity_type_description: subcommunity_type_description, station_class: station_class, ov_area: ov_area, ex_area: ex_area, ex_aval: ex_aval, ov_aval: ov_aval, ov_comac: ov_comac, ex_comac: ex_comac, ov_compc: ov_compc, ov_comprk: ov_comprk, ex_comprk: ex_comprk, ov_dvothac: ov_dvothac, ex_dvothac: ex_dvothac, ov_dvothpc: ov_dvothpc, ov_dvotprk: ov_dvotprk, ex_dvotprk: ex_dvotprk, ov_ed_att: ov_ed_att, ov_emp10: ov_emp10, ex_emp10: ex_emp10, ov_empcons: ov_empcons, ex_empcons: ex_empcons, ov_empden: ov_empden, ov_empplan: ov_empplan, ex_empplan: ex_empplan, ov_est_10: ov_est_10, ex_est_10: ex_est_10, ov_far: ov_far, ov_ghg: ov_ghg, ex_ghg: ex_ghg, ov_hh10: ov_hh10, ex_hh10: ex_hh10, ov_hhnocar: ov_hhnocar, ov_hhinc: ov_hhinc, ov_hresac: ov_hresac, ex_hresac: ex_hresac, ov_hrespc: ov_hrespc, ov_hrspkac: ov_hrspkac, ex_hrspkac: ex_hrspkac, ov_hu10: ov_hu10, ex_hu10: ex_hu10, ov_hu_0010: ov_hu_0010, ex_hu_0010: ex_hu_0010, ov_hucons: ov_hucons, ex_hucons: ex_hucons, ov_hupac: ov_hupac, ov_huplan: ov_huplan, ex_huplan: ex_huplan, ov_intnpac: ov_intnpac, ov_intntot: ov_intntot, ov_jobacc: ov_jobacc, ov_lresac: ov_lresac, ex_lresac: ex_lresac, ov_lrespc: ov_lrespc, ov_mix: ov_mix, ov_pct_abc: ov_pct_abc, ov_pcttran: ov_pcttran, ov_pop_0010: ov_pop_0010, ex_pop_0010: ex_pop_0010, ov_pop10: ov_pop10, ex_pop10: ex_pop10, ex_prkac: ex_prkac, ov_prkac: ov_prkac, ov_prkpc: ov_prkpc, ov_rentocc: ov_rentocc, ov_respc: ov_respc, ov_taxrev: ov_taxrev, ex_taxrev: ex_taxrev, ov_trnpcmi: ov_trnpcmi, ov_vacdvac: ov_vacdvac, ex_vacdvac: ex_vacdvac, ov_vacdvpc: ov_vacdvpc, ov_vacunac: ov_vacunac, ov_vacunpc: ov_vacunpc, ov_vehphh: ov_vehphh, ov_vmthda: ov_vmthday, phas: phase, map: mapc, walkscor: walkscore, etod_q0car: etod_q0car, etod_q25k: etod_q25k, etod_qabc: etod_qabc, etod_qaff: etod_qaff, etod_qdens: etod_qdens, etod_qgrav: etod_qgrav, etod_qrent: etod_qrent, etod_qtas: etod_qtas, etod_qtci: etod_qtci, etod_qwalk: etod_qwalk, etod_sub1t: etod_sub1t, etod_sub2o: etod_sub2o, etod_sub3d: etod_sub3d, etod_total: etod_total, etod_type: etod_type, created_at: created_at, updated_at: updated_at, line_descr: line_descr)
    record.save!
    
  end
end

    
