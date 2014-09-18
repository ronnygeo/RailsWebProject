require 'rails_helper'

RSpec.describe SearchController, :type => :controller do

  describe "GET listings" do
    it "returns http success" do
      get :listings
      expect(response).to be_success
    end
  end

  describe "GET events" do
    it "returns http success" do
      get :events
      expect(response).to be_success
    end
  end

end
