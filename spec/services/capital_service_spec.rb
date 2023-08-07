require "rails_helper" 

RSpec.describe CapitalService do 
  describe "instance methods" do 
    it "#get_capital_by_country" do 
      country = "Thailand" 
      search = CapitalService.new.get_capital_by_country(country)

    
    end
  end
end