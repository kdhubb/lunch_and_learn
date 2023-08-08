require 'rails_helper'

RSpec.describe 'Create Favorites', type: :request do
  describe 'create a favorite happy path' do
    it 'creates a favorite' do
      user = User.create!(name: 'Wolfie', email: 'wolfiebarks@wolfie.com', password: 'password', api_key: 'api_key')
      params = {
        "api_key": 'api_key',
        "country": 'thailand',
        "recipe_link": 'https://www.tastingtable.com/.....',
        "recipe_title": 'Crab Fried Rice (Khaao Pad Bpu)'
      }

      headers = { 'CONTENT_TYPE' => 'application/json' }
      post '/api/v1/favorites', headers:, params: JSON.generate(params)
      parsed = JSON.parse(response.body, symbolize_names: true)

      expected = { success: 'Favorite added successfully' }

      expect(response.code).to eq('201')
      expect(parsed).to eq(expected)
      expect(Favorite.last.country).to eq('thailand')
      expect(Favorite.last.recipe_link).to eq('https://www.tastingtable.com/.....')
      expect(Favorite.last.recipe_title).to eq('Crab Fried Rice (Khaao Pad Bpu)')
    end
  end

  describe 'create a favorite sad paths' do
    it 'returns an error for bad api key' do
      user = User.create!(name: 'Wolfie', email: 'wolfiebarks@wolfie.com', password: 'password', api_key: 'api_key')
      params = {
        "api_key": 'api_key5',
        "country": 'thailand',
        "recipe_link": 'https://www.tastingtable.com/.....',
        "recipe_title": 'Crab Fried Rice (Khaao Pad Bpu)'
      }

      headers = { 'CONTENT_TYPE' => 'application/json' }
      post '/api/v1/favorites', headers:, params: JSON.generate(params)
      parsed = JSON.parse(response.body, symbolize_names: true)

      expected = {
        errors: [
          {
            status: '404',
            title: 'Invalid API key'
          }
        ]
      }

      expect(response.code).to eq('404')
      expect(parsed).to eq(expected)
      expect(Favorite.last).to be(nil)
    end
  end
end
