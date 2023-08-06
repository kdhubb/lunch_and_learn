require "rails_helper" 

RSpec.describe "Search Recipes", type: :request do 
  describe "get a list of recipes by country" do 
    it "can return a list of serialized recipes", :vcr do 
      get "/api/v1/recipes?country=thailand" 
      parsed = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      recipes = parsed[:data]
      
      expect(recipes[0][:type]).to eq("recipe")
      expect(recipes[0][:attributes][:title]).to eq("Andy Ricker's Naam Cheuam Naam Taan Piip (Palm Sugar Simple Syrup)")
      expect(recipes[0][:attributes][:url]).to eq("http://www.edamam.com/ontologies/edamam.owl#recipe_3a551652abf5a1cef1421660d1b657d9")
      expect(recipes[0][:attributes][:image]).to be_a(String)
      expect(recipes[0][:attributes][:country]).to eq("thailand")
      expect(recipes[0][:id]).to be(nil) 

      second = {:id=>nil,
        :type=>"recipe",
        :attributes=>
         {:title=>"THAI COCONUT CREMES",
          :url=>"http://www.edamam.com/ontologies/edamam.owl#recipe_096a1c7ff1832055d9b4735653859926",
          :image=>
           "https://edamam-product-images.s3.amazonaws.com/web-img/8cd/8cd5ec2ff6310a088761956e4e571219.jpg?X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLWVhc3QtMSJGMEQCIBGf2SUflNhPCXfK9klhuU4CURnh3CKtcRIhTVwRFwLNAiBzMy799%2BZXrqQQTC4gyg8%2FumI%2FVU0g1NpLc5bc6SXBjSq5BQhUEAAaDDE4NzAxNzE1MDk4NiIM%2BCG9VsSpOMOwYrtIKpYFxboLNzOMdfgSJ0q%2FGUC8XVzZkfyrmN8o6%2F0cvP59tUGqf8%2B1UMY8yQUIfyAfp8a%2FVs4H%2Fnv4McEpdPai%2B9JEwD9kGC9CxjKQw%2BEw3m%2B%2FFm2eWCU22ftpX90%2BvJtMwZpv3GSZHE7nVQ0vUFPkkBkBgaThOutHj0dvk4cKtGqtKF%2F60CgmG40IA7%2FsCI0M1UW9eLLYFvm6kDpVXNMsVYzhxZVegDwSF%2FSiy70ormq3Up74uaOiTANEl5kWngBoBDwTOlu%2BTYFTlAdGovcEwLiUtuL6h5veHyO6nASCLXldYmMMrCjOJJMUBuyx6AzjqkfjYpz4MkCDtdT%2FpHtAXKbynf1Vc7L5zdc%2FT0TMe%2BMFO4KrNTCSh4URia%2B8uCJoppEB%2BlM%2FQSbwwSXO9FQZN6xzQ16fKMhRc1mYG9ZNgHzYX%2Fj%2B1yaDUNPhApWH941p%2FIbSzD95O%2FrLk0XLO3Hlz%2F9IiiqY7ef1NiMxaBzd50HjcJbeJpKHPEkgBEjz7Why0AAQXVynXSkRSqGbZYmCZ22VLoXJHWZn4sHCUB7%2Fh4lSOY5SYFR1hl9YYFv3phQfOHNIzFTJeDAT%2FB93Tj%2FqAAjsABLKWhrndc6Xbe9Jcu1zFtCvnMhaUpWeVFW%2FiiZ0jR0pUm4L5GS71CMMzkd2ic8ke66BfwUI768Y8O9dPLgCkw1NpiJ3dVr6hf2iFVx6JdfS0ep049%2BCdkot%2FlQuA9adqCMA9FBxTlyiR82ENNEggFum3QXsGeXz5IlRE7SHP1cJO1gtzDBsnOlCFcrx8rBCs55ZKekVjJMVRpeZ%2BWcaG5F5q6fp2c%2B8gloW27RctjeUY00AMnhL7EaMKs3E%2FEAE%2FP8GgQmZaMBFChCid8M4yqcYHBjMNeMwrpm8pgY6sgH%2FD6MlRb42UUEX2W%2F%2FI0Lg9GfsAaKeknycsrYzf3Qz5l0UYPJzbmcyWbS1LoErh6hali%2BDL3uF0GYhVdGSa4F6kk1tQdUu9TFTb5mh0760yFTfWyJ7FjPi6vLgLbJjmp%2B6IForFe8%2F12nkERuJiknfSzqdJ2gy6PPdpd%2BQbH3kx0KfWT20b22Cz14ft9BeYImyeUGDPrFMz4eiVffUrH3AbOGd6a2O2a9NnndrkA9AnfUl&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20230806T035324Z&X-Amz-SignedHeaders=host&X-Amz-Expires=3600&X-Amz-Credential=ASIASXCYXIIFBEJGFQSA%2F20230806%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=76a749ec4c1e69201353b1e6d3b8bf667a066301aa92f3028a14733c42ce4a40",
          :country=>"thailand"}}

      expect(recipes[1]).to eq(second)
    end

    it "can return a list of recipes with random country" do 
      request = get "/api/v1/recipes?choose_country_for_me=true" 
      parsed = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful

      recipes = parsed[:data]
      require 'pry'; binding.pry
    end
  end
end