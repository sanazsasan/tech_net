require 'spec_helper'

describe "members/index" do
  before(:each) do
    assign(:members, [
      stub_model(Member,
        :username => "Username",
        :name => "Name",
        :lastname => "Lastname",
        :email => "Email",
        :password => "Password",
        :experiences => "MyText"
      ),
      stub_model(Member,
        :username => "Username",
        :name => "Name",
        :lastname => "Lastname",
        :email => "Email",
        :password => "Password",
        :experiences => "MyText"
      )
    ])
  end

  it "renders a list of members" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Username".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Lastname".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Password".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
