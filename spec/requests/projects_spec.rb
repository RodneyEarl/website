require 'spec_helper'
include Warden::Test::Helpers
Warden.test_mode!

describe "Projects" do

  subject { page }

  let(:admin) { create(:user, :admin) }
  before do
    login_as(admin, :scope => :user)
  end

  describe "project creation" do
    before { visit projects_path }

    describe "with invalid information" do

      it "should not create a project" do
        expect { click_button "Submit"}.not_to change(Project, :count)
      end
    end

    describe "with valid information" do

      before do
        fill_in 'project_title', with: "Test title"
        fill_in 'project_content', with: "Test content"
      end

      it "should create a project" do
        expect { click_button "Submit" }.to change(Project, :count).by(1)
      end
    end
  end
end
