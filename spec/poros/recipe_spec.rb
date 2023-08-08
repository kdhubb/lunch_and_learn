require 'rails_helper'

RSpec.describe Recipe do
  describe 'initialize' do
    it 'exists with attributes' do
      data = {
        recipe: {
          uri: "here's a uri",
          label: 'curry recipe title',
          image: 'image_url'
        }
      }

      recipe = Recipe.new(data)

      expect(recipe.title).to eq('curry recipe title')
      expect(recipe.url).to eq("here's a uri")
      expect(recipe.image).to eq('image_url')
      expect(recipe.country).to be nil
      expect(recipe.id).to be nil
    end
  end
  describe 'instance methods' do
    it 'set_country' do
      data = {
        recipe: {
          uri: "here's a uri",
          label: 'curry recipe title',
          image: 'image_url'
        }
      }

      recipe = Recipe.new(data)

      expect(recipe.country).to be nil

      recipe.set_country('Mexico')

      expect(recipe.country).to eq('Mexico')
    end
  end
end
