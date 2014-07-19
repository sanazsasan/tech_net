require 'spec_helper'
describe Member do

  before { @member = Member.new(username: "sara", password: "123456", password_confirmation: "123456" , name: "Example member", lastname: "Hashemi", email: "member@example.com") }

  subject { @member }

  it { should respond_to(:username) }
  
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  
  it { should respond_to(:name) }
  it { should respond_to(:lastname) }
  it { should respond_to(:email) }

  describe "when username is too long" do
    before { @member.username = "a" * 51 }
    it { should_not be_valid }
  end
  
  describe "when name is too long" do
    before { @member.name = "a" * 51 }
    it { should_not be_valid }
  end


  describe "when lastname is too long" do
    before { @member.lastname = "a" * 51 }
    it { should_not be_valid }
  end
  
  describe "when email is too long" do
    before { @member.email = "a" * 41 }
    it { should_not be_valid }
  end

  describe "when email format is invalid" do
    it "should be invalid" do
      addresses = %w[member@foo,com user_at_foo.org example.user@foo.
                     foo@bar_baz.com foo@bar+baz.com]
      addresses.each do |invalid_address|
        @member.email = invalid_address
        expect(@member).not_to be_valid
      end
    end
  end


  describe "when email format is valid" do
    it "should be valid" do
      addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      addresses.each do |valid_address|
        @member.email = valid_address
        expect(@member).to be_valid
      end
    end
  end



 
  describe "when password is too long" do
    before { @member.password = "a" * 51 }
    it { should_not be_valid }
  end





end

