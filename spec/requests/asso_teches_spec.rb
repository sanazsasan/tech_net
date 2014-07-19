require 'spec_helper'

describe "AssoTeches" do
  describe "GET /asso_teches" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get asso_teches_path
      response.status.should be(200)
    end
  end
end
