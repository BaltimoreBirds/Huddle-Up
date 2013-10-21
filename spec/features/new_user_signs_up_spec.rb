require 'spec_helper'

feature'new user signs up', %Q{
  As an unregistered user
I want to sign up
So that I may find Huddles

} do

# Acceptance Criteria
# -Must be a valid, verified email
# -password must be at least six characters
# -password must be entered twice and match
# -email is sent to signee to verify email
# -thank you for signing up page is displayed, that also
#   makes note of the verification email

  it 'user registers with valid information,
      confirms email' do
    prev_count = User.count


    visit '/'
    click_on 'Register Here'
    fill_in 'Username', with: "Jahsprout"
    fill_in 'Email', with: 'mjakejake@msn.com'
    fill_in "user_password", with: 'hopefully'
    fill_in "user_password_confirmation", with: 'hopefully'
    fill_in "user_city", with: 'Columbia'
    choose 'Advanced'
    click_button ('Sign up')
    expect(User.count).to eql(prev_count + 1)

    expect(page).to have_content('Welcome to Huddle Up!')
    expect(page).to have_content('You have signed up successfully.')

  end
end
