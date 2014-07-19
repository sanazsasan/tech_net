require "spec_helper"

describe AssoTechesController do
  describe "routing" do

    it "routes to #index" do
      get("/asso_teches").should route_to("asso_teches#index")
    end

    it "routes to #new" do
      get("/asso_teches/new").should route_to("asso_teches#new")
    end

    it "routes to #show" do
      get("/asso_teches/1").should route_to("asso_teches#show", :id => "1")
    end

    it "routes to #edit" do
      get("/asso_teches/1/edit").should route_to("asso_teches#edit", :id => "1")
    end

    it "routes to #create" do
      post("/asso_teches").should route_to("asso_teches#create")
    end

    it "routes to #update" do
      put("/asso_teches/1").should route_to("asso_teches#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/asso_teches/1").should route_to("asso_teches#destroy", :id => "1")
    end

  end
end
