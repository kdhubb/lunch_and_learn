require "rails_helper" 

RSpec.describe ImageService do 
  describe "instance methods" do 
    it "#get_images_by_country", :vcr do 
      country = "Laos" 
      search = ImageService.new.get_images_by_country(country)

      expect(search).to be_a(Hash)
      expect(search[:results]).to be_an(Array)
      expect(search[:results][0][:alt_description]).to eq("time lapse photography of flying hot air balloon")
      expect(search[:results][0][:urls][:regular]).to eq("https://images.unsplash.com/photo-1540611025311-01df3cef54b5?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0ODU0Njl8MHwxfHNlYXJjaHwxfHxMYW9zfGVufDB8fHx8MTY5MTM1NjE5M3ww&ixlib=rb-4.0.3&q=80&w=1080")
    end
  end
end