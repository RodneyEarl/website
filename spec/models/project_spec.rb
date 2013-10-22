require 'spec_helper'

describe Project do

  before do
    @project = Project.new(title: "Test", content: "content")
  end

  subject { @project }

  it { should respond_to(:title) }
  it { should respond_to(:content) }

  it { should be_valid }

  describe "when title is not present" do
    before { @project.title = "" }
    it { should_not be_valid }
  end

  describe "when content is not present" do
    before { @project.content = "" }
    it { should_not be_valid }
  end
end
