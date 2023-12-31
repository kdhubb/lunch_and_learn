require "rails_helper" 

RSpec.describe "Get Favorites" do 
  describe "get a user's favorites" do 
    before(:each) do 
      @user1 = User.create!(name: 'Wolfie', email: 'wolfiebarks@wolfie.com', password: 'password', api_key: 'api_key5')
      @user2 = User.create!(name: 'Wolfie', email: 'wolfiechews@wolfie.com', password: 'password', api_key: 'api_key3')
      @fav1 = @user1.favorites.create!(country: "Thailand", recipe_link: "drunken_noodle_url", recipe_title: "drunken noodles")
      @fav2 = @user1.favorites.create!(country: "Mexico", recipe_link: "chiles_enogadas_url", recipe_title: "chiles enogadas")
    end
    it "sends all user's favories happy path" do 
      get "/api/v1/favorites?api_key=api_key5"

      parsed = JSON.parse(response.body, symbolize_names: true)

      expect(parsed[:data]).to be_an(Array)
      expect(parsed[:data].count).to eq(2)
      expect(parsed[:data][0].keys).to eq([:id, :type, :attributes])
      expect(parsed[:data][0][:attributes].keys).to eq([:recipe_title, :recipe_link, :country, :created_at])
      expect(parsed[:data][0][:id]).to eq("#{@fav1.id}")
      expect(parsed[:data][0][:type]).to eq("favorite")
      expect(parsed[:data][0][:attributes][:recipe_title]).to eq("drunken noodles")
      expect(parsed[:data][0][:attributes][:recipe_link]).to eq("drunken_noodle_url")
      expect(parsed[:data][0][:attributes][:country]).to eq("Thailand")
      expect(parsed[:data][0][:attributes][:created_at]).to be_a(String)
    end
    it "sends all user's favories happy path no favorites" do 
      get "/api/v1/favorites?api_key=api_key3"

      parsed = JSON.parse(response.body, symbolize_names: true)

      expected = {
            "data": []
        }
      expect(parsed[:data]).to be_an(Array)
      expect(parsed).to eq(expected)
    end

    it "returns an error for invalid api key" do 
      get "/api/v1/favorites?api_key=dog_bones"

      parsed = JSON.parse(response.body, symbolize_names: true)

      expected = {
            "errors": [
                {
                    "status": "404",
                    "title": "Invalid API key"
                }
            ]
        }
        
      expect(parsed).to eq(expected)
    end
  end
end