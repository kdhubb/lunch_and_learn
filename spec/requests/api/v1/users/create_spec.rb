require "rails_helper" 

RSpec.describe "Create a New User" do 
  describe "create user happy path" do 
    it "can post a new user" do 
      params = {
        "name": "Odell",
        "email": "goodboy@ruffruff.com",
        "password": "treats4lyf",
        "password_confirmation": "treats4lyf"
      }
      headers = { 'CONTENT_TYPE' => 'application/json' }
      post "/api/v1/users", headers: headers, params: JSON.generate(params)
      parsed = JSON.parse(response.body, symbolize_names: true)
      
      
      expect(response.code).to eq("201")
      expect(parsed.keys).to eq([:data])
      expect(parsed[:data].keys).to eq([:id, :type, :attributes])
      expect(parsed[:data][:attributes].keys).to eq([:name, :email, :api_key])
      expect(parsed[:data][:type]).to eq("user")
      expect(parsed[:data][:id]).to be_a(String)
      expect(parsed[:data][:attributes][:name]).to eq("Odell")
      expect(parsed[:data][:attributes][:email]).to eq("goodboy@ruffruff.com")
      expect(parsed[:data][:attributes][:api_key]).to be_a(String)
    end
  end
end