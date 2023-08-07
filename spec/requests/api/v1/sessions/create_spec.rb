require "rails_helper" 

RSpec.describe "Post a Session" do 
  describe "create new session" do 
    it "can post a new session happy path" do 
      user = User.create!(name: "Wolfie", email: "goodboy@ruffruff.com", password: "treats4lyf", api_key: "stuff")
      params = {
        "email": "goodboy@ruffruff.com",
        "password": "treats4lyf"
      }
      headers = { 'CONTENT_TYPE' => 'application/json' }
      post "/api/v1/sessions", headers: headers, params: JSON.generate(params)
      parsed = JSON.parse(response.body, symbolize_names: true)
      
      expected = {
        "data": {
          "id": "#{user.id}",
          "type": "user",
          "attributes": {
            "name": "Wolfie",
            "email": "goodboy@ruffruff.com",
            "api_key": "stuff"
          }
        }
      }

      expect(response.code).to eq("201")
      expect(parsed).to eq(expected)
    end
  end
end