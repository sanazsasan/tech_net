require 'spec_helper'

describe "members/show" do
  before(:each) do
    @member = assign(:member, stub_model(Member,
      :username => "Username",
      :name => "Name",
      :lastname => "Lastname",
      :email => "Email",
      :password => "Password",
      :experiences => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Username/)
    rendered.should match(/Name/)
    rendered.should match(/Lastname/)
    rendered.should match(/Email/)
    rendered.should match(/Password/)
    rendered.should match(/MyText/)
  end
end
