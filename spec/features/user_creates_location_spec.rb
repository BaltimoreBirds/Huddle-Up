require'spec_helper'

feature'user creates locations', %Q{
  As a user
  I want to create a location
  so that I can add a local court to the court database
    and create huddles for that location.
} do

  # Acceptance Critera:
  # -User creates location using address and court name
  #   -must submit address and court name
  # -user can associate a huddle with a location from a select(typing next)

  scenario'user creates location with valid address from nav bar' do
    visit root_path
    sign_in_as(user)

    click_link "Find"
    click "Locations"

    expect(page).to have_content("Locations")
    click_link "Create a court location"

    expect(page).to have_content('Add this court Location')
    find("input[placeholder='Court address']").set "Martin Road, Columbia, MD"
    find("input[placeholder='Court name']").set "Martin Road Park"
    click_link("Add this court Location")

    expect(page).to have_content("Locations")
  end

end
