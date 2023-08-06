require "rails_helper" 

RSpec.describe LearningResource do 
  describe "initialize" do 
    it "can initialize with attributes" do 
      resource = LearningResource.new

      expect(resource.id).to be(nil)
      expect(resource.country).to be(nil)
      expect(resource.video).to eq({})
      expect(resource.images).to eq([])
    end
  end
end