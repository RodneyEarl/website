require 'spec_helper'

describe "Contacts" do

  subject { page }

  describe "contact email info" do
    before { visit contact_path }

    describe "with invalid information" do

      describe "error messages" do
        before { click_button "Send" }
        it { should have_content('Please fill all fields.') }
      end
    end

    describe "with valid information" do

      before do
        fill_in 'message_name', with: "test"
        fill_in 'message_email', with: "example@test.com"
        fill_in 'message_subject', with: "test subject"
        fill_in 'message_body', with: "test body"
      end
      
      describe "have thank you message" do
        before { click_button "Send" }
        it { should have_content('Thank you.') }
      end
    end
  end
end
