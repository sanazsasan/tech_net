require "spec_helper"

describe TechesController do
  describe "routing" do

    it "routes to #index" do
      get("/teches").should route_to("teches#index")
    end

    it "routes to #new" do
      get("/teches/new").should route_to("teches#new")
    end

    it "routes to #show" do
      get("/teches/1").should route_to("teches#show", :id => "1")
    end

    it "routes to #edit" do
      get("/teches/1/edit").should route_to("teches#edit", :id => "1")
    end

    it "routes to #create" do
      post("/teches").should route_to("teches#create")
    end

    it "routes to #update" do
      put("/teches/1").should route_to("teches#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/teches/1").should route_to("teches#destroy", :id => "1")
    end

  end
end
