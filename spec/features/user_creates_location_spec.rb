require'spec_helper'

feature'user creates locations', %Q{
  As a user
  I want to create a location
  so that I can add a local court to the court database
    and create huddles for that location.
} do

  # Acceptance Critera:
  # -User creates location using
  #   -street
  #   -City
  #   -State
  #   -postal code
  #   -court name
  # -user can associate a huddle with a location from a select(typing next)

  let(:user1){FactoryGirl.create(:user)}

  scenario'user creates location with valid address from nav bar' do
    prev_count = Location.all.count
    visit root_path
    sign_in_as(user1)

    click_link "Find"
    click_link "Courts"
    click_link "Add Court"

    expect(page).to have_content("Complete the required fields to add a court")
    find("input[placeholder='Street']").set "6668 Buckstone Court"
    find("input[placeholder='City']").set "Columbia"
    find("input[placeholder='State']").set "MD"
    find("input[placeholder='Postal code']").set "21044"
    find("input[placeholder='Court name']").set "Martin Road Park"
    click_button "Add this court location"

    expect(Location.all.count).to eql(prev_count+1)
    expect(page).to have_content("Martin Road Park")
  end

  scenario'user gives bad information when creating a new court' do
    prev_count = Location.all.count
    visit root_path
    sign_in_as(user1)

    click_link "Find"
    click_link "Courts"
    click_link "Add Court"

    expect(page).to have_content("Complete the required fields to add a court")
    find("input[placeholder='Street']").set "6668 Buckstone Court"
    find("input[placeholder='City']").set "Columbia"
    find("input[placeholder='State']").set "MD"
    find("input[placeholder='Postal code']").set "potato"
    find("input[placeholder='Court name']").set "Columbia Gym"
    click_button "Add this court location"

    expect(Location.all.count).to eql(prev_count)
    expect(page).to have_content("Complete the required fields to add a court")
    expect(page).to have_content("Error")
  end

end
