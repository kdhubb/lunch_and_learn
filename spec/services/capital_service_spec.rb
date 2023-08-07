require "rails_helper" 

RSpec.describe CapitalService do 
  describe "instance methods" do 
    it "#get_country_data", :vcr do 
      country = "Nigeria" 
      search = CapitalService.new.get_country_data(country)

      expect(search.first).to be_a(Hash)
      expect(search.first[:name][:common]).to eq("Nigeria")
      expect(search.first[:capital].first).to eq("Abuja")
    end

    it "#get_capital_by_country", :vcr do 
      country = "Nigeria" 
      search = CapitalService.new.get_capital_by_country(country)

      expect(search).to eq("Abuja")
    end
  end
end