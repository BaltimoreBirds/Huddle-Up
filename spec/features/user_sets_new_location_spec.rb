require 'spec_helper'

feature'user sets new locations', %Q{
  As a registered user
  I want to set locations
  So that I may set the location of a huddle
} do

  let(:location1){FactoryGirl.create(:location, address: 'New York, NY, USA', court_name: 'The Bronx Courts')}
  let(:location2){FactoryGirl.create(:location, address: 'Brooklyn, NY, USA')}


  scenario'user views location details'do

    columbia = location1
    clarksville = location2

    visit locations_path

    expect(page).to have_content("Locations")
    expect(page).to have_content("New York, NY")
    expect(page).to have_content("More Info")
    click_link 'More Info about The Bronx Courts'

    expect(page).to have_content('Brooklyn')

  end


end
