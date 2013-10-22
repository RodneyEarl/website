require 'spec_helper'

describe Message do

  before do
    @message = Message.new(name: "Example User", email: "user@example.com",
                           subject: "subject", body: "content")
  end

  subject { @message }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:subject) }
  it { should respond_to(:body) }
  it { should be_valid }

  describe "it should initialize params" do
    it "checks name" do
      @message.name.should eql "Example User"
    end

    it "checks email" do
      @message.email.should eql "user@example.com"
    end

    it "checks subject" do
      @message.subject.should eql "subject"
    end

    it "checks body" do
      @message.body.should eql "content"
    end
  end

  describe "when name is not present" do
    before { @message.name = "" }
    it { should_not be_valid }
  end

  describe "when email is not present" do
    before { @message.email = "" }
    it { should_not be_valid }
  end

  describe "when email format is invalid" do
    it "should be invalid" do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo. foo@bar_baz.com foo@bar+baz.com foo@bar..com]
      addresses.each do |invalid_address|
        @message.email = invalid_address
        expect(@message).not_to be_valid
      end
    end
  end

  describe "when subject is not present" do
    before { @message.subject = "" }
    it { should_not be_valid }
  end

  describe "when body is not present" do
    before { @message.subject = "" }
    it { should_not be_valid }
  end
end
