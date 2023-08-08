require 'rails_helper'

RSpec.describe Video do
  describe 'initialize' do
    it 'can initialize with attributes' do
      video = Video.new('Title', 'here_is_id')

      expect(video.title).to eq('Title')
      expect(video.youtube_video_id).to eq('here_is_id')
    end
  end
end
