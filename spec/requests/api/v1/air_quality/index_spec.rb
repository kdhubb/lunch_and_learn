require "rails_helper" 

RSpec.describe "Get Air Quality", type: :request do 
  describe "air quality for capital give country" do 
    it "returns air quality info" do 
      get "/api/v1/air_quality?country=Nigeria"
      parsed = JSON.parse(response.body, symbolize_names: true)
      
      expect(response).to be_successful
      air_quality = parsed[:data]

      expect(air_quality.keys).to eq([:id, :type, :attributes])
      expect(air_quality[:id]).to be(nil)
      expect(air_quality[:type]).to eq("air_quality")
      expect(air_quality[:attributes].keys).to eq([:aqi, :pm25_concentration, :co_concentration, :city])
      expect(air_quality[:attributes][:aqi]).to be_an(Integer)
      expect(air_quality[:attributes][:pm25_concentration]).to be_a(Float || Integer)
      expect(air_quality[:attributes][:co_concentration]).to be_a(Float || Integer)
      expect(air_quality[:attributes][:city]).to eq("Abuja")
    end

    it "picks a random country's capital if none is given" do 
      get "/api/v1/air_quality?country="
      parsed = JSON.parse(response.body, symbolize_names: true)
      
      expect(response).to be_successful
      air_quality = parsed[:data]

      expect(air_quality.keys).to eq([:id, :type, :attributes])
      expect(air_quality[:id]).to be(nil)
      expect(air_quality[:type]).to eq("air_quality")
      expect(air_quality[:attributes].keys).to eq([:aqi, :pm25_concentration, :co_concentration, :city])
      expect(air_quality[:attributes][:aqi]).to be_an(Integer)
      expect(air_quality[:attributes][:pm25_concentration]).to be_a(Float || Integer)
      expect(air_quality[:attributes][:co_concentration]).to be_a(Float || Integer)
      expect(air_quality[:attributes][:city]).to be_a(String)
    end

    it "returns an error if an invalid country is entered", :vcr do 
      get "/api/v1/air_quality?country=blah"
      parsed = JSON.parse(response.body, symbolize_names: true)
      
      expect(response).to_not be_successful
      expect(response.status).to eq(404)
      expect(parsed).to eq({error: "Invalid country"})
    end

    it "returns an error if no parameters given", :vcr do 
      get "/api/v1/air_quality?"
      parsed = JSON.parse(response.body, symbolize_names: true)
      
      expect(response).to_not be_successful
      expect(response.status).to eq(418)
      expect(parsed).to eq({error: "No parameters given"})
    end
  end
end