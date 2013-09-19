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

  it 'user registers with valid information' do
    FactoryGirl.create(:user)
    prev_count = User.count

    visit '/'
    fill_in 'Username', with: "Jahsprout"
    fill_in 'Email', with: 'mjakejake@msn.com'
    fill_in 'Password', with: 'hopefully'
    fill_in 'city', with: 'SomePlace'
    choose 'Advanced'
    click_on('Sign in')
    # binding.pry
    expect(User.count).to eql(prev_count + 1)
  end

end
