require "rails_helper"

RSpec.describe AirQualityService do 
  describe "instance methods" do 
    it "#get_list_of_countries" do 
      query = {country: "Nigeria"}
      search = AirQualityService.new.get_aqi(query)
    
     
    end
  end
end