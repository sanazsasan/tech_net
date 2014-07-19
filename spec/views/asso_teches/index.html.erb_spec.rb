require 'spec_helper'

describe "asso_teches/index" do
  before(:each) do
    assign(:asso_teches, [
      stub_model(AssoTech,
        :tech_id => 1,
        :peer_id => 2
      ),
      stub_model(AssoTech,
        :tech_id => 1,
        :peer_id => 2
      )
    ])
  end

  it "renders a list of asso_teches" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
