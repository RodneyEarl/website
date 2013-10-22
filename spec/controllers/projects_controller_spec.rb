require 'spec_helper'

describe ProjectsController do

  let(:newProject) { create(:project) }
  let(:admin) { create(:user, :admin) }

  describe "GET #index" do
   it "renders the index template" do
      get :index
      response.should render_template :index
    end

    it "loads all of the projects into @items" do
      get :index
      assigns(:items).should include(newProject)
    end

    describe "admin not signed in" do

      it "should not be able to go to create" do
        get 'create'
        response.should redirect_to '/projects'
      end
    end
  end

  describe "POST #create" do
    describe "admin signed in" do

      before do
        sign_in admin
      end

      it "should be able to submit a project through create" do
        post 'create', :project => { "title" => "title", "content" => "content" }
        response.should redirect_to '/projects'
        flash[:success].should_not be_nil
      end

      it "should not have success flash if unable to save" do
        post 'create', :project => { "title" => "", "content" => "content" }
        response.should redirect_to '/projects'
        flash[:success].should be_nil
      end
    end
  end
end
