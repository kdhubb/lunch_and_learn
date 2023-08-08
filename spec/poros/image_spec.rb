require 'rails_helper'

RSpec.describe Image do
  describe 'initialize' do
    it 'can intialize with attributes' do
      image = Image.new('awesome_url', 'description of image')

      expect(image.url).to eq('awesome_url')
      expect(image.alt_tag).to eq('description of image')
    end
  end
end
