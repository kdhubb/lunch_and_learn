require "rails_helper" 

RSpec.describe AirQuality do 
  describe "initialize" do 
    it "can initialize with attributes" do 
      data = {:CO=>{:concentration=>220.3, :aqi=>2},
      :NO2=>{:concentration=>3.77, :aqi=>4},
      :O3=>{:concentration=>70.1, :aqi=>84},
      :SO2=>{:concentration=>2.47, :aqi=>3},
      :"PM2.5"=>{:concentration=>2.74, :aqi=>8},
      :PM10=>{:concentration=>3.69, :aqi=>3},
      :overall_aqi=>84}

      aq = AirQuality.new(data)

      expect(aq.city).to be(nil)
      expect(aq.id).to be(nil)
      aq.city = "Paris"
      expect(aq.city).to eq("Paris")
      expect(aq.aqi).to eq(84)
      expect(aq.pm25_concentration).to eq(2.74)
      expect(aq.co_concentration).to eq(220.3)
    end
  end
end