require 'rails_helper'

RSpec.describe RecipeService do
  describe 'instance methods' do
    it '#get_recipes_by_country' do
      VCR.use_cassette("RecipeService/instance_methods/_get_recipes_by_country", match_requests_on: [:path]) do
        country = 'Thailand'
        search = RecipeService.new.get_recipes_by_country(country)

        expect(search).to be_a(Hash)
        expect(search[:hits][0][:recipe][:uri]).to eq('http://www.edamam.com/ontologies/edamam.owl#recipe_3a551652abf5a1cef1421660d1b657d9')
        expect(search[:hits][0][:recipe][:label]).to eq("Andy Ricker's Naam Cheuam Naam Taan Piip (Palm Sugar Simple Syrup)")
        expect(search[:hits][0][:recipe][:image]).to be_a(String)
      end
    end
  end
end
