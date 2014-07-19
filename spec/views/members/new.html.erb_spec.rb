require 'spec_helper'

describe "members/new" do
  before(:each) do
    assign(:member, stub_model(Member,
      :username => "MyString",
      :name => "MyString",
      :lastname => "MyString",
      :email => "MyString",
      :password => "MyString",
      :experiences => "MyText"
    ).as_new_record)
  end

  it "renders new member form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", members_path, "post" do
      assert_select "input#member_username[name=?]", "member[username]"
      assert_select "input#member_name[name=?]", "member[name]"
      assert_select "input#member_lastname[name=?]", "member[lastname]"
      assert_select "input#member_email[name=?]", "member[email]"
      assert_select "input#member_password[name=?]", "member[password]"
      assert_select "textarea#member_experiences[name=?]", "member[experiences]"
    end
  end
end
