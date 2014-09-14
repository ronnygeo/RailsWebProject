require 'rails_helper'

RSpec.describe "Packages", :type => :request do
  describe "GET /packages" do
    it "works! (now write some real specs)" do
      get packages_path
      expect(response.status).to be(200)
    end
  end
end
