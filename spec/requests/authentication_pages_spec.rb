require 'spec_helper'
describe "Authentication" do
  subject { page }
  describe "signin page" do
    before { visit signin_path }
    it { should have_content('Sign in') }
    it { should have_title('Sign in') }
  end
  describe "signin" do
    before { visit signin_path }
    describe "with invalid information" do
      describe "followed by signout" do
        before { click_link "Sign out" }
        it { should have_link('Sign in') }
      end
      before { click_button "Sign in" }
      it { should have_title('Sign in') }
      it { should have_selector('div.alert.alert-error', text: 'Invalid') }
      describe "after visiting another page" do
        before { click_link "Home" }
        it { should_not have_selector('div.alert.alert-error') }
      end
    end
  end
end