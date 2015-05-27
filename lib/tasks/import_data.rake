namespace :db do
  desc "Fill database with the spreadsheet data"
  namespace :populate do

    desc "Populate all tables with fixtures CSVs"
    task all: :environment do
      copy_filedata "#{Rails.root}/db/fixtures/station_areas.csv",   :station_areas
      copy_filedata "#{Rails.root}/db/fixtures/data_dictionary.csv", :dictionary_entries
      copy_filedata "#{Rails.root}/db/fixtures/transit_lines.csv",   :transit_lines
    end

    desc "Populate station areas table with fixtures/station_areas.csv"
    task station_areas:   :environment do
      copy_filedata "#{Rails.root}/db/fixtures/station_areas.csv",   :station_areas
    end

    desc "Populate data dictionary table with fixtures/data_dictionary.csv"
    task data_dictionary: :environment do
      copy_filedata "#{Rails.root}/db/fixtures/data_dictionary.csv", :dictionary_entries
    end

    desc "Populate transit lines table with fixtures/transit_lines.csv"
    task transit_lines:   :environment do
      copy_filedata "#{Rails.root}/db/fixtures/transit_lines.csv",   :transit_lines
    end
  end
  
  namespace :empty do
    
    desc "Truncate all the tables -- remove all data from it and reset the primary key to 1"
    task all: :environment do
      StationArea.destroy_all
      StationArea.reset_primary_key
      
      DictionaryEntry.destroy_all
      DictionaryEntry.reset_primary_key
      
      TransitLine.destroy_all
      TransitLine.reset_primary_key
    end

    desc "Empty station area table"
    task station_areas:   :environment do
      StationArea.destroy_all
      StationArea.reset_primary_key
    end

    desc "Empty data dictionary table"
    task data_dictionary: :environment do
      DictionaryEntry.destroy_all
      DictionaryEntry.reset_primary_key
    end

    desc "Empty transit line table"
    task transit_lines:   :environment do
      TransitLine.destroy_all
      TransitLine.reset_primary_key
    end
  end
end