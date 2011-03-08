require 'spec_helper'

describe RetireesController do

  def mock_retiree(stubs={})
    (@mock_retiree ||= mock_model(Retiree).as_null_object).tap do |retiree|
      retiree.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all retirees as @retirees" do
      Retiree.stub(:all) { [mock_retiree] }
      get :index
      assigns(:retirees).should eq([mock_retiree])
    end
  end

  describe "GET show" do
    it "assigns the requested retiree as @retiree" do
      Retiree.stub(:find).with("37") { mock_retiree }
      get :show, :id => "37"
      assigns(:retiree).should be(mock_retiree)
    end
  end

  describe "GET new" do
    it "assigns a new retiree as @retiree" do
      Retiree.stub(:new) { mock_retiree }
      get :new
      assigns(:retiree).should be(mock_retiree)
    end
  end

  describe "GET edit" do
    it "assigns the requested retiree as @retiree" do
      Retiree.stub(:find).with("37") { mock_retiree }
      get :edit, :id => "37"
      assigns(:retiree).should be(mock_retiree)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created retiree as @retiree" do
        Retiree.stub(:new).with({'these' => 'params'}) { mock_retiree(:save => true) }
        post :create, :retiree => {'these' => 'params'}
        assigns(:retiree).should be(mock_retiree)
      end

      it "redirects to the created retiree" do
        Retiree.stub(:new) { mock_retiree(:save => true) }
        post :create, :retiree => {}
        response.should redirect_to(retiree_url(mock_retiree))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved retiree as @retiree" do
        Retiree.stub(:new).with({'these' => 'params'}) { mock_retiree(:save => false) }
        post :create, :retiree => {'these' => 'params'}
        assigns(:retiree).should be(mock_retiree)
      end

      it "re-renders the 'new' template" do
        Retiree.stub(:new) { mock_retiree(:save => false) }
        post :create, :retiree => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested retiree" do
        Retiree.should_receive(:find).with("37") { mock_retiree }
        mock_retiree.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :retiree => {'these' => 'params'}
      end

      it "assigns the requested retiree as @retiree" do
        Retiree.stub(:find) { mock_retiree(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:retiree).should be(mock_retiree)
      end

      it "redirects to the retiree" do
        Retiree.stub(:find) { mock_retiree(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(retiree_url(mock_retiree))
      end
    end

    describe "with invalid params" do
      it "assigns the retiree as @retiree" do
        Retiree.stub(:find) { mock_retiree(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:retiree).should be(mock_retiree)
      end

      it "re-renders the 'edit' template" do
        Retiree.stub(:find) { mock_retiree(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested retiree" do
      Retiree.should_receive(:find).with("37") { mock_retiree }
      mock_retiree.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the retirees list" do
      Retiree.stub(:find) { mock_retiree }
      delete :destroy, :id => "1"
      response.should redirect_to(retirees_url)
    end
  end

end
