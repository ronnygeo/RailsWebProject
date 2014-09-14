require 'rails_helper'

RSpec.describe "PackageLines", :type => :request do
  describe "GET /package_lines" do
    it "works! (now write some real specs)" do
      get package_lines_path
      expect(response.status).to be(200)
    end
  end
end
