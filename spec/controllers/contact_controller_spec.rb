require 'spec_helper'

describe ContactController do
  
  describe "GET #new" do
    it "renders contact page" do
      get :new
      response.should render_template :new
    end
  end

  describe "POST #create" do
    it "should be able to submit a contact and mail it" do
      post 'create', :message => { "name" => "Example", "email" => "test@example.com",
                                   "subject" => "test", "body" => "body" }
      response.should redirect_to '/contact'
      flash[:notice].should_not be_nil
    end

    it "should not submit a contact with invalid mail" do
      post 'create', :message => { "name" => "" }
      response.should render_template :new
      flash.now[:alert].should_not be_nil
    end
  end
end
