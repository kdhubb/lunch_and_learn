require "rails_helper" 

RSpec.describe "Search Recipes", type: :request do 
  describe "get a list of recipes by country" do 
    it "can return a list of serialized recipes" do 
      request = get "/api/v1/recipes?country=thailand" 
      parsed = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      recipes = parsed[:data]
      expect(recipes[0][:attributes][:title]).to eq("Andy Ricker's Naam Cheuam Naam Taan Piip (Palm Sugar Simple Syrup)")
      expect(recipes[0][:attributes][:url]).to eq("Andy Ricker's Naam Cheuam Naam Taan Piip (Palm Sugar Simple Syrup)")
      expect(recipes[0][:attributes][:image]).to be_a(String)
    end
  end
end