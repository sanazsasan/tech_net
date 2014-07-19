require 'spec_helper'

describe "teches" do
  describe "GET /teches" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get teches_path
      response.status.should be(200)
    end
  end
end
