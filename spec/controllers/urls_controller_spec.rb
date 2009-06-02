require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe UrlsController do

  describe "routes" do
    it "should recognize the new url route" do
      params_from(:get, "/urls/new").should == { :controller => 'urls', :action => 'new'}
    end

    it "should recognize the create url route" do
      params_from(:post, "/urls/").should == { :controller => 'urls', :action => 'create'}
    end

    it "should recognize the show url route" do
      params_from(:get, "/urls/7").should == { :controller => 'urls', :action => 'show', :id => '7'}
    end
  end

  describe "#new" do
    before(:each) do
      get :new
    end

    it "should succeed" do
      response.should be_success
    end

    it "should create an unsaved url" do
      assigns(:short_url).should be_new_record
    end
  end

  describe "#create" do
    context "with valid parameters" do
      it "should redirect to show" do
        post :create, :url => {:location => 'http://www.cafepress.com'}
        response.should redirect_to(url_path(assigns(:short_url)))
      end
    end

    context "with invalid parameters" do
      it "should render the new url template" do
        post :create, :url => { :location => 'FAKE'}
        response.should render_template('urls/new')
      end
    end
  end

  describe "#show" do
    it "should succeed" do
      get :show, :id => urls(:valid_url).to_param
      response.should be_success
    end
  end
end