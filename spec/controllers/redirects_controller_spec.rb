require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe RedirectsController do
  describe "routes" do
    it "should absorb every route that doesn't match another controller" do
      params_from(:get, "/whatever").should == { :controller => 'redirects', :action => 'show', :slug => 'whatever'}
    end
  end

  describe "#show" do
    context "with a valid URL slug" do
      it "should redirect" do
        @url = urls(:valid_url)
        get :show, :slug => @url.slug
        response.should redirect_to(@url.location)
      end
    end

    context "with an invalid URL slug" do
      it "should redirect" do
        get :show, :slug => "INVALID"
        response.should be_missing
      end
    end
  end
end