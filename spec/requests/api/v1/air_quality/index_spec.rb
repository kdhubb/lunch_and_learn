require "rails_helper" 

RSpec.describe "Get Air Quality", type: :request do 
  describe "air quality for capital give country" do 
    it "returns air quality info" do 
      get "/api/v1/"
    end
  end
end