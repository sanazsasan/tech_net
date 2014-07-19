require 'spec_helper'

describe "members/edit" do
  before(:each) do
    @member = assign(:member, stub_model(Member,
      :username => "MyString",
      :name => "MyString",
      :lastname => "MyString",
      :email => "MyString",
      :password => "MyString",
      :experiences => "MyText"
    ))
  end

  it "renders the edit member form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", member_path(@member), "post" do
      assert_select "input#member_username[name=?]", "member[username]"
      assert_select "input#member_name[name=?]", "member[name]"
      assert_select "input#member_lastname[name=?]", "member[lastname]"
      assert_select "input#member_email[name=?]", "member[email]"
      assert_select "input#member_password[name=?]", "member[password]"
      assert_select "textarea#member_experiences[name=?]", "member[experiences]"
    end
  end
end
