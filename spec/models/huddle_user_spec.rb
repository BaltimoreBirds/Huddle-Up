require 'spec_helper'

describe HuddleUser do
  it{should belong_to(:user)}
  it{should belong_to(:huddle)}

  it{should have_valid(:user).when(User.new)}
  it{should_not have_valid(:user).when(nil)}
  it{should have_valid(:huddle).when(Huddle.new)}
  it{should_not have_valid(:huddle).when(nil)}
end
