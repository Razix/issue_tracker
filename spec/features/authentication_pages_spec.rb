require 'spec_helper'

describe "Authentication" do

  subject { page }

  describe "signin page" do
    before { visit signin_path }

    it { should have_selector('h1', text: 'Please sign in') }
  end

  describe "signin" do
    before { visit signin_path }

    describe "with invalid information" do
      before { click_button "Sign in" }

      it { should have_selector('h1', text: 'Please sign in') }
      it { should have_selector('div.alert.alert-error', text: 'Invalid') }

      describe "after visiting another page" do
        before { click_link "New ticket" }
        it { should_not have_selector('div.alert.alert-error') }
      end
    end

    describe "with valid information" do
      let(:admin) { FactoryGirl.create(:admin) }
      before do
        fill_in "Username", with: admin.username.upcase
        fill_in "Password", with: admin.password
        click_button "Sign in"
      end

      # it { should have_link('Profile', href: admin_path(admin)) }
      it { should have_link('New ticket',  href: root_path) }
      it { should have_link('Sign out',    href: signout_path) }
      it { should_not have_link('Sign in', href: signin_path) }
    end
  end
end