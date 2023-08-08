require 'rails_helper'

RSpec.describe CountriesService do
  describe 'instance methods' do
    it '#get_list_of_countries', :vcr do
      search = CountriesService.new.get_list_of_countries

      expect(search).to be_an(Array)
      expect(search[0][:name][:common]).to eq('Saudi Arabia')
    end
  end
end
