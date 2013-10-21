# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



locations = [
  ["Martin Road Park", "6701 Martin Road","Columbia", "MD","21044"],
  ["Swansfield Recreation Park", "5659 Cedar Lane","Columbia", "MD","21044"],
  ["Swansfield Recreation Park", "6151 Day Long Lane","Clarksville", "MD","21029"],
  ["River Hill High School", "12101 Clarksville Pike","Clarksville", "MD","21029"],
  ["Clarksville Middle School", "6535 Trotter Road","Clarksville", "MD","21029"],
  ["Centennial High School", "4300 Centennial Lane","Ellicott City", "MD","21042"],
  ["Wilde Lake High School", "5460 Trumpeter Rd","Columbia", "MD","21044"],
  ["Wilde Lake High School", "5460 Trumpeter Rd","Columbia", "MD","21044"],
  ["The Athletic Club", "5435 Beaverkill Rd","Columbia", "MD","21044"],
  ["BU Fitness and Recreation Center", "915 Commonwealth Ave","Boston", "MA","02115"],
  ["Shad Hall Fitness", "Soldiers Field Rd","Boston", "MA","02163"],
  ["Marino Center", "360 Huntington Ave","Boston", "MA","02115"],
  ["Rogers Park", "90 Roger's Park Ave","Brighton", "MA","02135"],
  ["Albion Park", "Albion Street","Somerville", "MA","02144"],

]

locations.each do |location|
  new_location = Location.where(court_name: location[0])
  if new_location.empty?
    new_location = Location.create(court_name: location[0],
                               street: location[1],
                               city: location[2],
                               state: location[3],
                               postal: location[4])
    new_location.save!
  end
end

