namespace :db do
  desc "Fill database with the spreadsheet data"
  task populate: :environment do
    copy_filedata("#{Rails.root}/db/fixtures/station_areas_06_19_14.csv", :station_areas)
  end

  desc "Truncate the table -- remove all data from it and reset the primary key to 1"
  task empty: :environment do
    StationArea.destroy_all
    StationArea.reset_primary_key
  end
end