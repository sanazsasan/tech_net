require 'spec_helper'

describe "teches/edit" do
  before(:each) do
    @tech = assign(:tech, stub_model(Tech,
      :tech_name => "MyString"
    ))
  end

  it "renders the edit tech form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", tech_path(@tech), "post" do
      assert_select "input#tech_tech_name[name=?]", "tech[tech_name]"
    end
  end
end
