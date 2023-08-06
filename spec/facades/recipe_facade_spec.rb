require "rails_helper" 
require "./app/poros/recipe.rb"

RSpec.describe RecipeFacade do 
  describe "instance methods" do 
    it "#recipes_by_country", :vcr do
      query = {
        country: "Thailand"
      }
      recipes = RecipeFacade.new(query).recipes_by_country

      expect(recipes).to be_an(Array)
      expect(recipes[0].title).to eq("Andy Ricker's Naam Cheuam Naam Taan Piip (Palm Sugar Simple Syrup)")
      expect(recipes[0].url).to eq("http://www.edamam.com/ontologies/edamam.owl#recipe_3a551652abf5a1cef1421660d1b657d9")
      expect(recipes[0].image).to be_a(String)
      expect(recipes[0].country).to eq("Thailand")
    end
  end
end