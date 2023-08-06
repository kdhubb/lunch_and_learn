require "rails_helper" 

RSpec.describe ImageFacade do 
  describe "instance methods" do 
    it "#images_by_country", :vcr do
      query = {country: "Laos"}
      search = ImageFacade.new(query).images_by_country

      expect(search).to be_an(Array)
      expect(search[0].url).to be_a(String)
      expect(search[0].alt_tag).to be_a(String)
      expect(search[0].url).to eq("https://images.unsplash.com/photo-1540611025311-01df3cef54b5?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0ODU0Njl8MHwxfHNlYXJjaHwxfHxMYW9zfGVufDB8fHx8MTY5MTM1NjE5M3ww&ixlib=rb-4.0.3&q=80&w=1080")
      expect(search[0].alt_tag).to eq("time lapse photography of flying hot air balloon")
    end
  end
end