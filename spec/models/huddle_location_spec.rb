require'spec_helper'

describe HuddleLocation do

  it{should belong_to (:location)}
  it{should belong_to (:huddle)}

  it{should have_valid(:location_id).when(1,2)}
  it{should_not have_valid(:location_id).when(nil, " ")}

  it{should have_valid(:huddle_id).when(1,2)}
  it{should_not have_valid(:huddle_id).when(nil, " ")}
end
