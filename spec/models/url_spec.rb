require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Url do
  before(:each) do
    @url = Url.new(:location => 'http://www.cafepress.com')
  end

  it 'should be valid' do
    @url.should be_valid
  end

  describe "validations" do
    it "should require a location" do
      @url.location = nil
      @url.should have(1).error_on(:location)
    end

    it "should require the location be a url" do
      @url.location = "not!!!!!a url"
      @url.should have(1).error_on(:location)
    end
  end

  describe "after save" do
    it "should set the url slug" do
      @url.save!
      @url.slug.should_not be_blank
    end
  end
end
