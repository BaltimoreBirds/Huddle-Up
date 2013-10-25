require 'spec_helper'

describe User do

  it{should have_many(:huddles)}

  it{should have_valid(:email).when('mike@aol.com')}
  it{should_not have_valid(:email).when(nil, ' ')}

  it{should have_valid(:city).when('mike@aol.com')}
  it{should_not have_valid(:city).when(nil, ' ')}


  it'determines if a user is signed in' do
    user = FactoryGirl.create(:user)
    current_user = nil
    expect(User.user_signed_in?(current_user)).to eql(false)
  end

  it'determines if a user is signed in' do
    user = FactoryGirl.create(:user)
    current_user = user
    expect(User.user_signed_in?(current_user)).to eql(true)
  end
end
