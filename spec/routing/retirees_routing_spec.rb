require "spec_helper"

describe RetireesController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/retirees" }.should route_to(:controller => "retirees", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/retirees/new" }.should route_to(:controller => "retirees", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/retirees/1" }.should route_to(:controller => "retirees", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/retirees/1/edit" }.should route_to(:controller => "retirees", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/retirees" }.should route_to(:controller => "retirees", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/retirees/1" }.should route_to(:controller => "retirees", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/retirees/1" }.should route_to(:controller => "retirees", :action => "destroy", :id => "1")
    end

  end
end
