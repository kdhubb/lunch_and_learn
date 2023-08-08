require 'rails_helper'

RSpec.describe VideoService do
  describe 'instance methods' do
    it '#get_videos_by_country' do
      VCR.use_cassette("VideoService/instance_methods/_get_videos_by_country", match_requests_on: [:path]) do
        country = 'Laos'
        search = VideoService.new.get_videos_by_country(country)

        expect(search).to be_a(Hash)
        expect(search[:items]).to be_an(Array)
        expect(search[:items][0][:snippet][:title]).to eq('A Super Quick History of Laos')
        expect(search[:items][0][:id][:videoId]).to eq('uw8hjVqxMXw')
      end
    end
  end
end
