# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :station_area do
    station_name "MyString"
    etod_score 1
    vehicle_miles_traveled "9.99"
    transit_commute_share "9.99"
    vehicle_ownership "9.99"
    transportation_ghgs "9.99"
  end
end
