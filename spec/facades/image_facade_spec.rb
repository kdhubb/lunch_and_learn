require 'rails_helper'

RSpec.describe ImageFacade do
  describe 'instance methods' do
    it '#images_by_country' do
      VCR.use_cassette("ImageFacade/instance_methods/_images_by_country", match_requests_on: [:path]) do
        query = 'Laos'
        search = ImageFacade.new.images_by_country(query)

        expect(search).to be_an(Array)
        expect(search[0].url).to be_a(String)
        expect(search[0].alt_tag).to be_a(String)
        expect(search[0].url).to be_a(String)
        expect(search[0].alt_tag).to eq('time lapse photography of flying hot air balloon')
      end
    end
  end
end
