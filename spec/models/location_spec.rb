require 'spec_helper'

describe Location do

  it{should belong_to :user}
  it{should belong_to :huddle}

  it{should have_valid(:street).when("6667 Buckstone Court")}
  it{should_not have_valid(:street).when( nil, " ")}

  it{should have_valid(:city).when("Columbia")}
  it{should_not have_valid(:city).when( nil, " ", 1)}

  it{should have_valid(:state).when("Maryland", "MD")}
  it{should_not have_valid(:state).when( nil, " ", "Potato",1)}

  it{should have_valid(:postal).when(21044)}
  it{should_not have_valid(:postal).when( nil, " ", "Potato")}

  it{should have_valid(:court_name).when("Martin Road Park")}
  it{should_not have_valid(:court_name).when(" ", nil, 7)}

  it{should have_valid(:longitude).when(123123123)}
  it{should_not have_valid(:longitude).when(nil, " ", "potato")}

  it{should have_valid(:latitude).when(123123123)}
  it{should_not have_valid(:latitude).when(nil, " ", "potato")}

end
