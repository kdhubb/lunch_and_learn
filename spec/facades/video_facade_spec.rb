require 'rails_helper'

RSpec.describe VideoFacade do
  describe 'instance methods' do
    it '#video_by_country' do
      VCR.use_cassette("VideoFacade/instance_methods/_video_by_country", match_requests_on: [:path]) do
        query = 'Laos'
        video = VideoFacade.new.video_by_country(query)

        expect(video).to be_a(Video)
        expect(video.title).to eq('A Super Quick History of Laos')
        expect(video.youtube_video_id).to eq('uw8hjVqxMXw')
      end
    end

    it 'returns empty hash if country is nil' do
      query = ''

      video = VideoFacade.new.video_by_country(query)

      expect(video).to eq({})
    end
  end
end
