require 'spec_helper'

describe "Admin pages" do

  subject { page }

  describe "signup page" do
    before { visit signup_path }

    it { should have_selector('h1',    text: 'Time to Sign Up') }
  end

  describe "signup" do

    before { visit signup_path }

    let(:submit) { "Create account" }

    describe "with invalid information" do
      it "should not create a admin" do
        expect { click_button submit }.not_to change(Admin, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in "Username",     with: "adminko"
        fill_in "Password",     with: "foobar"
        fill_in "Confirmation", with: "foobar"
      end

      it "should create an admin" do
        expect { click_button submit }.to change(Admin, :count).by(1)
      end
    end
  end
end