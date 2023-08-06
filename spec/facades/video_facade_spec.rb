require "rails_helper" 

RSpec.describe VideoFacade do 
  describe "instance methods" do 
    it "#video_by_country", :vcr do
      query = {
        country: "Laos"
      }
      video = VideoFacade.new(query).video_by_country
      
      expect(video).to be_a(Video)
      expect(video.title).to eq("A Super Quick History of Laos")
      expect(video.youtube_video_id).to eq("uw8hjVqxMXw")
    end
  end
end