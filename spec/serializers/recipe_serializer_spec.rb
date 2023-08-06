require "rails_helper" 

RSpec.describe RecipeSerializer, type: :serializer do
    recipe_data = {
          recipe: {
            label: "Vegan Nachos",
            uri: "here_is_recipe",
            image: "image_url",
            country: "US"
        }}
    let(:recipe) do 
      Recipe.new(recipe_data)
    end
    subject { described_class.new(recipe)}
    
    it { is_expected.to have_type(:recipe) }
    it { is_expected.to serialize_attribute(:title)}
    it { is_expected.to serialize_attribute(:url)}
    it { is_expected.to serialize_attribute(:image)}
    it { is_expected.to serialize_attribute(:country)}
end