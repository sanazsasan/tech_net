require 'spec_helper'

describe "rates/index" do
  before(:each) do
    assign(:rates, [
      stub_model(Rate,
        :reter_id => 1,
        :reted_id => 2,
        :score => 3
      ),
      stub_model(Rate,
        :reter_id => 1,
        :reted_id => 2,
        :score => 3
      )
    ])
  end

  it "renders a list of rates" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
