require 'spec_helper'

describe StaticPagesController do
  
  describe "render pages" do

    it "should render home page" do
      get :home
      response.should render_template :home
    end

    it "should render work page" do
      get :work
      response.should render_template :work
    end

    it "should render references page" do
      get :references
      response.should render_template :references
    end
  end
end
