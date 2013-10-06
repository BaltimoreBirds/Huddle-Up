require 'spec_helper'

describe Huddle do
  it{should have_valid(:size_of_huddle).when(5, 10)}
  it{should_not have_valid(:size_of_huddle).when("potato", "eight", nil, 1, " ")}

  it{should have_valid(:skill_level).when("Advanced", "Any")}
  it{should_not have_valid(:skill_level).when(5, nil, " ", "potato")}

  it{should have_valid(:time_and_date).when(DateTime.now + 20.minutes)}
  it{should_not have_valid(:time_and_date).when(DateTime.now)}
  it{should_not have_valid(:time_and_date).when(nil, "potato")}

  it{should have_many(:users)}
end
