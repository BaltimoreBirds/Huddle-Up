require 'spec_helper'

describe HuddleUser do
  it{should belong_to(:user)}
  it{should belong_to(:huddle)}

  it{should have_valid(:user_id).when(1,2)}
  it{should_not have_valid(:user_id).when(nil)}
  it{should have_valid(:huddle_id).when(1,2)}
  it{should_not have_valid(:huddle_id).when(nil)}
end
