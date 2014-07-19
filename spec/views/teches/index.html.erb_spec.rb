require 'spec_helper'

describe "teches/index" do
  before(:each) do
    assign(:teches, [
      stub_model(Tech,
        :tech_name => "Tech Name"
      ),
      stub_model(Tech,
        :tech_name => "Tech Name"
      )
    ])
  end

  it "renders a list of teches" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Tech Name".to_s, :count => 2
  end
end
