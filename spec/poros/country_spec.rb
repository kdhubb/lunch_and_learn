require "rails_helper"

RSpec.describe Country do 
  describe "initialize" do 
    it "can initialize with attributes" do 
      country1 = Country.new({
        name: {
          common: "Mexico"
        }
      })
      country2 = Country.new({
        name: {
          common: "Argentina"
        }
      })

      expect(country1.name).to eq("Mexico")
      expect(country2.name).to eq("Argentina")
    end
  end
end