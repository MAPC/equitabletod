namespace :db do
  desc "Fill database with the spreadsheet data"
  task populate: :environment do
    copy_filedata "#{Rails.root}/db/fixtures/station_areas.csv",   :station_areas
    copy_filedata "#{Rails.root}/db/fixtures/data_dictionary.csv", :dictionary_entries
    copy_filedata "#{Rails.root}/db/fixtures/transit_lines.csv",   :transit_lines
  end

  desc "Truncate the tables -- remove all data from it and reset the primary key to 1"
  task empty: :environment do
    StationArea.destroy_all
    StationArea.reset_primary_key
    
    DictionaryEntry.destroy_all
    DictionaryEntry.reset_primary_key
    
    TransitLine.destroy_all
    TransitLine.reset_primary_key
  end
end