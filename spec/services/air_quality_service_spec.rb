require "rails_helper"

RSpec.describe AirQualityService do 
  describe "instance methods" do 
    it "#get_aqi_by_capital", :vcr do 
      query = "Paris"
      search = AirQualityService.new.get_aqi_by_capital(query)
      
      expect(search).to be_a(Hash)
      expect(search[:overall_aqi]).to be_an(Integer)
    end
  end
end