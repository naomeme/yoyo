require "spec_helper"

describe TopicsController do
  describe "routing" do

    it "routes to #index" do
      get("/").should route_to("topics#index")
    end

    it "routes to #new" do
      get("/new").should route_to("topics#new")
    end

    it "routes to #show" do
      get("/1").should route_to("topics#show", :id => "1")
    end

    it "routes to #edit" do
      get("/1/edit").should route_to("topics#edit", :id => "1")
    end

    it "routes to #create" do
      post("/").should route_to("topics#create")
    end

    it "routes to #update" do
      put("/1").should route_to("topics#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/1").should route_to("topics#destroy", :id => "1")
    end

  end
end
