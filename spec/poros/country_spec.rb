require "rails_helper"

RSpec.describe Country do 
  describe "initialize" do 
    it "can initialize with attributes" do 
      country = Country.new({
        name: {
          common: "Mexico"
        }
      })

      expect(country.name).to eq("Mexico")
    end
  end
end