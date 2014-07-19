require 'spec_helper'

describe "rates/edit" do
  before(:each) do
    @rate = assign(:rate, stub_model(Rate,
      :reter_id => 1,
      :reted_id => 1,
      :score => 1
    ))
  end

  it "renders the edit rate form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", rate_path(@rate), "post" do
      assert_select "input#rate_reter_id[name=?]", "rate[reter_id]"
      assert_select "input#rate_reted_id[name=?]", "rate[reted_id]"
      assert_select "input#rate_score[name=?]", "rate[score]"
    end
  end
end
