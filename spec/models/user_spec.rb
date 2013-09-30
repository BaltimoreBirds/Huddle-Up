require 'spec_helper'

describe User do

  it{should have_many(:huddles)}

  it{should have_valid(:email).when('mike@aol.com')}
  it{should_not have_valid(:email).when(nil, ' ')}

  it{should have_valid(:city).when('mike@aol.com')}
  it{should_not have_valid(:city).when(nil, ' ')}









end
