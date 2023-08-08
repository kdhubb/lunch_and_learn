require 'rails_helper'

RSpec.describe LearningResourceFacade do
  describe 'instance methods' do
    it '#learning_resource_by_country' do
      VCR.use_cassette("LearningResourceFacade/instance_methods/_learning_resource_by_country", match_requests_on: [:path]) do
        params = { country: 'Laos' }
        learning_resource = LearningResourceFacade.new(params).learning_resource_by_country

        expect(learning_resource.id).to be(nil)
        expect(learning_resource.video).to be_a(Video)
        expect(learning_resource.images).to be_an(Array)
        expect(learning_resource.images[0]).to be_an(Image)
        expect(learning_resource.country).to eq('Laos')
      end
    end
  end
end
