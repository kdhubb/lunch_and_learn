require 'rails_helper'

RSpec.describe CountriesFacade do
  describe 'instance methods' do
    it '#countries_list', :vcr do
      search = CountriesFacade.new.countries_list

      expect(search).to be_an(Array)
      expect(search[0].name).to eq('Saudi Arabia')
      expect(search[1].name).to eq('Cameroon')
      expect(search[2].name).to eq('Iran')
      expect(search[3].name).to eq('United Arab Emirates')
    end
  end
end
