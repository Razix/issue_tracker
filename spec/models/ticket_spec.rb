require 'spec_helper'

describe Ticket do

  before { @ticket = Ticket.new(name: "Customer name", 
                                email: "customer@email.com", 
                                issue: "everything looks bad", 
                                subject: "help me", 
                                body: "Please... I'll describe everything") }

  subject { @ticket }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:issue) }
  it { should respond_to(:subject) }
  it { should respond_to(:body) }
  it { should respond_to(:unique_reference) }

  it { should be_valid }

  describe "when name is not present" do
    before { @ticket.name = " " }
    it { should_not be_valid }
  end

  describe "when email is not present" do
    before { @ticket.email = "" }
    it { should_not be_valid }
  end

  describe "when subject is not present" do
    before { @ticket.subject = " " }
    it { should_not be_valid }
  end

  describe "when body is not present" do
    before { @ticket.body = " " }
    it { should_not be_valid }
  end

  describe "when name is too long" do
    before { @ticket.name = "a" * 31 }
    it { should_not be_valid }
  end

  describe "when subject is too long" do
    before { @ticket.subject = "a" * 71 }
    it { should_not be_valid }
  end

  describe "when body is too short" do
    before { @ticket.body = "a" * 29 }
    it { should_not be_valid }
  end

  describe "when email format is invalid" do
    it "should be invalid" do
      email_address = %w[custo@.er@test.com customer.email.com
                        customer+super+mail.com emails@dot+com
                        customer.email.com my@email@email.com]
      email_address.each do |invalid_address|
        @ticket.email = invalid_address
        @ticket.should_not be_valid
      end      
    end
  end

  describe "when email format is valid" do
    it "should be valid" do
      email_address = %w[customer@test.com i_am_customer@test.me
                        this-is-customer@ticket.net my.ticket@ticket.com]
      email_address.each do |valid_address|
        @ticket.email = valid_address
        @ticket.should be_valid
      end      
    end
  end
end
