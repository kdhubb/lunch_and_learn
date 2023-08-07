require "rails_helper"

RSpec.describe CountriesService do 
  describe "instance methods" do 
    it "#get_list_of_countries", :vcr do 
      
      search = CountriesService.new.get_list_of_countries
    
      expect(search).to be_an(Array)
      expect(search[0][:name][:common]).to eq("Saudi Arabia")
    end

    it "#validate_country", :vcr do 
      expect(CountriesService.new.validate_country("blah")).to be(false)
      expect(CountriesService.new.validate_country("fooey")).to be(false)
      expect(CountriesService.new.validate_country("South Africa")).to be(true)
      expect(CountriesService.new.validate_country("Argentina")).to be(true)
    end
  end
end