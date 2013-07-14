require 'spec_helper'

describe Admin do

  before do
    @admin = Admin.new(username: "test_admin", password: "foobar",
                       password_confirmation: "foobar")
  end

  subject { @admin }

  it { should respond_to(:username) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:authenticate) }

  it { should be_valid }

  describe "when username is not present" do
    before { @admin.username = " " }
    it { should_not be_valid }
  end

  describe "when username is too short" do
    before { @admin.username = "a" * 5 }
    it { should_not be_valid }
  end

  describe "when username is too long" do
    before { @admin.username = "a" * 31 }
    it { should_not be_valid }
  end

  describe "when password is not present" do
    before { @admin.password = @admin.password_confirmation = " " }
    it { should_not be_valid }
  end

  describe "when password doesn't match confirmation" do
    before { @admin.password_confirmation = "mismatch" }
    it { should_not be_valid }
  end

  describe "when password confirmation is nil" do
    before { @admin.password_confirmation = nil }
    it { should_not be_valid }
  end

  describe "with a password that's too short" do
    before { @admin.password = @admin.password_confirmation = "a" * 5 }
    it { should be_invalid }
  end

  describe "return value of authenticate method" do
    before { @admin.save }
    let(:found_user) { Admin.find_by_username(@admin.username) }

    describe "with valid password" do
      it { should == found_user.authenticate(@admin.password) }
    end

    describe "with invalid password" do
      let(:user_for_invalid_password) { found_user.authenticate("invalid") }

      it { should_not == user_for_invalid_password }
      specify { user_for_invalid_password.should be_false }
    end
  end

  describe "username address with mixed case" do
    let(:mixed_case_username) { "SupErADmiN" }

    it "should be saved as all lower-case" do
      @admin.username = mixed_case_username
      @admin.save
      @admin.reload.username.should == mixed_case_username.downcase
    end
  end

end