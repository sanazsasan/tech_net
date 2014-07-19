require 'spec_helper'

describe "asso_teches/new" do
  before(:each) do
    assign(:asso_tech, stub_model(AssoTech,
      :tech_id => 1,
      :peer_id => 1
    ).as_new_record)
  end

  it "renders new asso_tech form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", asso_teches_path, "post" do
      assert_select "input#asso_tech_tech_id[name=?]", "asso_tech[tech_id]"
      assert_select "input#asso_tech_peer_id[name=?]", "asso_tech[peer_id]"
    end
  end
end
