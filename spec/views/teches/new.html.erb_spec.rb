require 'spec_helper'

describe "teches/new" do
  before(:each) do
    assign(:tech, stub_model(Tech,
      :tech_name => "MyString"
    ).as_new_record)
  end

  it "renders new tech form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", teches_path, "post" do
      assert_select "input#tech_tech_name[name=?]", "tech[tech_name]"
    end
  end
end
