require 'rails_helper'

RSpec.describe 'Learning Resource', type: :request do
  describe 'get a learning resource by country' do
    it 'can return a serialized learning resource', :vcr do
      get '/api/v1/learning_resources?country=laos'
      parsed = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      learning_resource = parsed[:data]

      expect(learning_resource[:id]).to be(nil)
      expect(learning_resource[:type]).to eq('learning_resource')
      expect(learning_resource[:attributes][:country]).to eq('laos')
      expect(learning_resource[:attributes][:video][:title]).to eq('A Super Quick History of Laos')
      expect(learning_resource[:attributes][:video][:youtube_video_id]).to eq('uw8hjVqxMXw')
      expect(learning_resource[:attributes][:images]).to be_an(Array)
      expect(learning_resource[:attributes][:images].count).to eq(10)
      expect(learning_resource[:attributes][:images][0][:url]).to eq('https://images.unsplash.com/photo-1540611025311-01df3cef54b5?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0ODU0Njl8MHwxfHNlYXJjaHwxfHxsYW9zfGVufDB8fHx8MTY5MTM1OTY3Nnww&ixlib=rb-4.0.3&q=80&w=1080')
      expect(learning_resource[:attributes][:images][0][:alt_tag]).to eq('time lapse photography of flying hot air balloon')
    end

    it 'will return empty video and images if none are found', :vcr do
      get '/api/v1/learning_resources?country='''
      parsed = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      learning_resource = parsed[:data]

      expect(learning_resource[:id]).to be(nil)
      expect(learning_resource[:type]).to eq('learning_resource')
      expect(learning_resource[:attributes][:country]).to eq('')
      expect(learning_resource[:attributes][:video]).to eq({})
      expect(learning_resource[:attributes][:images]).to be_an(Array)
      expect(learning_resource[:attributes][:images].count).to eq(0)
    end
  end
end
