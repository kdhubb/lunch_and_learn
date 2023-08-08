require 'rails_helper'

RSpec.describe LearningResource do
  describe 'initialize' do
    it 'can initialize with attributes' do
      video = Video.new('Title', 'here_is_id')
      images = [Image.new('awesome_url', 'description of image'), Image.new('here_is_url', 'image_description')]
      params = {
        country: 'Laos',
        video:,
        images:
      }
      resource = LearningResource.new(params)

      expect(resource.id).to be(nil)
      expect(resource.country).to eq('Laos')
      expect(resource.video).to eq(video)
      expect(resource.images).to eq(images)
    end
  end
end
