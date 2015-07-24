require "spec_helper"

describe ToDoListsController do
  describe "routing" do

    it "routes to #index" do
      get("/to_do_lists").should route_to("to_do_lists#index")
    end

    it "routes to #new" do
      get("/to_do_lists/new").should route_to("to_do_lists#new")
    end

    it "routes to #show" do
      get("/to_do_lists/1").should route_to("to_do_lists#show", :id => "1")
    end

    it "routes to #edit" do
      get("/to_do_lists/1/edit").should route_to("to_do_lists#edit", :id => "1")
    end

    it "routes to #create" do
      post("/to_do_lists").should route_to("to_do_lists#create")
    end

    it "routes to #update" do
      put("/to_do_lists/1").should route_to("to_do_lists#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/to_do_lists/1").should route_to("to_do_lists#destroy", :id => "1")
    end

  end
end
