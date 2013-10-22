require 'spec_helper'

describe "StaticPages" do

  subject { page }

  shared_examples_for "all static pages" do
    it { should have_title(full_title(page_title)) }
  end

  describe "Home page" do
    before { visit root_path }
    let(:heading)    { 'Rodney Earl' }
    let(:page_title) { '' }

    it_should_behave_like "all static pages"
    it { should_not have_title('| Home') }
  end

  describe "Work page" do
    before { visit work_path }
    let(:heading)    { 'Rodney Earl' }
    let(:page_title) { ' Work Experience' }

    it_should_behave_like "all static pages"
  end

  describe "Papers page" do
    before { visit papers_path }
    let(:heading)    { 'Rodney Earl' }
    let(:page_title) { 'Published Papers' }

    it_should_behave_like "all static pages"
  end

  describe "References page" do
    before { visit references_path }
    let(:heading)    { 'Rodney Earl' }
    let(:page_title) { 'References' }

    it_should_behave_like "all static pages"
  end
end
