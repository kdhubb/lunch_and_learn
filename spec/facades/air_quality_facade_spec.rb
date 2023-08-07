require "rails_helper" 

RSpec.describe AirQualityFacade do 
  describe "instance methods" do 
    it "#aqi_by_capital", :vcr do
      query = { country: "Cuba"}

      aqi = AirQualityFacade.new(query).aqi_by_capital

      expect(aqi).to be_a(AirQuality)
      expect(aqi.city).to eq("Havana")
      expect(aqi.aqi).to be_an(Integer)
      expect(aqi.co_concentration).to be_a(Float || Integer)
      expect(aqi.pm25_concentration).to be_a(Float || Integer)
      expect(aqi.id).to be(nil)
    end
  end
end