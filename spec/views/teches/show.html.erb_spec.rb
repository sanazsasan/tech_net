require 'spec_helper'

describe "teches/show" do
  before(:each) do
    @tech = assign(:tech, stub_model(Tech,
      :tech_name => "Tech Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Tech Name/)
  end
end
