require 'spec_helper'

describe "rates/show" do
  before(:each) do
    @rate = assign(:rate, stub_model(Rate,
      :reter_id => 1,
      :reted_id => 2,
      :score => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/3/)
  end
end
