require 'rails_helper'

RSpec.describe "Socials", :type => :request do
  describe "GET /socials" do
    it "works! (now write some real specs)" do
      get socials_path
      expect(response.status).to be(200)
    end
  end
end
