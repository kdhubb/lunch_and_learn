require "rails_helper" 

RSpec.describe RecipeSerializer do 
  describe "serialization of recipe objects" do 
    it "will send only what information is in JSON contract" do 
      recipe_data = {
        recipe: {
          label: "Vegan Nachos",
          uri: "here_is_recipe",
          image: "image_url",
          country: "US"
      }}
      recipe = Recipe.new(recipe_data)

      serialized = RecipeSerializer.new(recipe)
      json_response = JSON.generate(serialized)
      
      expect(serialized[:data].first[:id]).to be(nil)
    end
  end
end