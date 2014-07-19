require 'spec_helper'

describe "rates/new" do
  before(:each) do
    assign(:rate, stub_model(Rate,
      :reter_id => 1,
      :reted_id => 1,
      :score => 1
    ).as_new_record)
  end

  it "renders new rate form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", rates_path, "post" do
      assert_select "input#rate_reter_id[name=?]", "rate[reter_id]"
      assert_select "input#rate_reted_id[name=?]", "rate[reted_id]"
      assert_select "input#rate_score[name=?]", "rate[score]"
    end
  end
end
