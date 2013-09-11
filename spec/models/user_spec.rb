require 'spec_helper'

describe User do


    it { should have_valid(:username).when('swan_tree_hill', 'xxFARTERxx900', 'RubyFanBoy' )}
    it {should_not have_valid(:username).when(nil, '')}

    # it {should validate_uniqueness_of(:username) }

    # describe "Validation of Username",
end


