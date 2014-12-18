require "spec_helper"

describe "Legislator" do


  let(:legislator) { FactoryGirl.create(:legislator) }

  describe "#index" do
    it "success" do
      get "/legislators/"
      response.should be_success
    end
  end

  describe "#show" do
    it "success" do
      get "/legislators/#{legislator.id}"
      response.should be_success
    end
  end

end