require 'spec_helper'

describe User do
  it { should validate_presence_of :email }

  describe 'validations'do
    before do
      @valid_attributes = {
        username: "coolguy",
        email: "asdasda@aol.com"
      }
    end

    it "is valid when given valid attributes" do
      user = User.new(@valid_attributes)
      expect(user).to be_valid
    end

    it "requires a username" do
      user = User.new(@valid_attributes.merge(username: nil))
      expect(user).not_to be_valid
    end

    it "requires a email" do
      user = User.new
      expect(user.errors).to include(:email)
    end
    it "requires a name"
  end
end

# shoulda-matchers gem.
