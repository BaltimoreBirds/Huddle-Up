require 'spec_helper'

describe Location do

  it{should belong_to :user}
  it{should belong_to :huddle}

  it{should have_valid(:address).when("6667 Buckstone Court, Columbia, MD")}
  it{should_not have_valid(:address).when("6667", nil, " ")}

  it{should have_valid(:court_name).when("Martin Road Park")}
  it{should_not have_valid(:court_name).when(" ", nil, 7)}

  it{should have_valid(:longitude).when(123123123)}
  it{should_not have_valid(:longitude).when(nil, " ", "potato")}

  it{should have_valid(:latitude).when(123123123)}
  it{should_not have_valid(:latitude).when(nil, " ", "potato")}

end
