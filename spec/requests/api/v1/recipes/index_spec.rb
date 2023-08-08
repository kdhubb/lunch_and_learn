require 'rails_helper'

RSpec.describe 'Search Recipes', type: :request do
  describe 'get a list of recipes by country' do
    it 'can return a list of serialized recipes' do
      VCR.use_cassette("Search_Recipes/get_a_list_of_recipes_by_country/can_return_a_list_of_serialized_recipes", match_requests_on: [:path]) do
        get '/api/v1/recipes?country=thailand'
        parsed = JSON.parse(response.body, symbolize_names: true)

        expect(response).to be_successful
        recipes = parsed[:data]

        expect(recipes[0][:type]).to eq('recipe')
        expect(recipes[0][:attributes][:title]).to eq("Andy Ricker's Naam Cheuam Naam Taan Piip (Palm Sugar Simple Syrup)")
        expect(recipes[0][:attributes][:url]).to eq('http://www.edamam.com/ontologies/edamam.owl#recipe_3a551652abf5a1cef1421660d1b657d9')
        expect(recipes[0][:attributes][:image]).to be_a(String)
        expect(recipes[0][:attributes][:country]).to eq('thailand')
        expect(recipes[0][:id]).to be(nil)
      end
    end

    xit 'can return a list of recipes with random country' do
      request = get '/api/v1/recipes?choose_country_for_me=true'
      parsed = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful

      recipes = parsed[:data]

      expect(recipes[0][:type]).to eq('recipe')
      expect(recipes[0][:attributes][:title]).to be_a(String)
      expect(recipes[0][:attributes][:url]).to be_a(String)
      expect(recipes[0][:attributes][:image]).to be_a(String)
      expect(recipes[0][:attributes][:country]).to be_a(String)
      expect(recipes[0][:id]).to be(nil)
    end
  end
end
