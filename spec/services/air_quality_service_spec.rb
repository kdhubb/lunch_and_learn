require "rails_helper"

RSpec.describe AirQualityService do 
  describe "instance methods" do 
    it "#get_aqi_by_capital", :vcr do 
      query = "Paris"
      search = AirQualityService.new.get_aqi_by_capital(query)
      
      expect(search).to be_a(Hash)
      expect(search[:overall_aqi]).to be_an(Integer)
      expect(search[:"PM2.5"][:concentration]).to be_a(Float)
      expect(search[:CO][:concentration]).to be_a(Float)
    end
  end
end