require 'rails_helper'

RSpec.describe 'Create a New User' do
  describe 'create user happy path' do
    it 'can post a new user' do
      params = {
        "name": 'Odell',
        "email": 'goodboy@ruffruff.com',
        "password": 'treats4lyf',
        "password_confirmation": 'treats4lyf'
      }
      headers = { 'CONTENT_TYPE' => 'application/json' }
      post '/api/v1/users', headers:, params: JSON.generate(params)
      parsed = JSON.parse(response.body, symbolize_names: true)

      expect(response.code).to eq('201')
      expect(parsed.keys).to eq([:data])
      expect(parsed[:data].keys).to eq(%i[id type attributes])
      expect(parsed[:data][:attributes].keys).to eq(%i[name email api_key])
      expect(parsed[:data][:type]).to eq('user')
      expect(parsed[:data][:id]).to be_a(String)
      expect(parsed[:data][:attributes][:name]).to eq('Odell')
      expect(parsed[:data][:attributes][:email]).to eq('goodboy@ruffruff.com')
      expect(parsed[:data][:attributes][:api_key]).to be_a(String)
      expect(User.last.name).to eq('Odell')
      expect(User.last.email).to eq('goodboy@ruffruff.com')
      expect(User.last.password_digest).to be_a(String)
    end

    it "sends an error if password and password confirmation don't match" do
      params = {
        "name": 'Odell',
        "email": 'goodboy@ruffruff.com',
        "password": 'treats4ly',
        "password_confirmation": 'treats4lyf'
      }
      headers = { 'CONTENT_TYPE' => 'application/json' }
      post '/api/v1/users', headers:, params: JSON.generate(params)
      parsed = JSON.parse(response.body, symbolize_names: true)

      expected = {
        errors: [
          {
            status: '400',
            title: 'Password and password confirmation must match'
          }
        ]
      }
      expect(response.code).to eq('400')
      expect(parsed).to eq(expected)
    end

    it "sends an error if email isn't unique" do
      User.create!(name: 'Wolfie', email: 'goodboy@ruffruff.com', password: 'password')

      params = {
        "name": 'Odell',
        "email": 'goodboy@ruffruff.com',
        "password": 'treats4lyf',
        "password_confirmation": 'treats4lyf'
      }
      headers = { 'CONTENT_TYPE' => 'application/json' }
      post '/api/v1/users', headers:, params: JSON.generate(params)
      parsed = JSON.parse(response.body, symbolize_names: true)

      expected = {
        errors: [
          {
            status: '400',
            title: 'Validation failed: Email has already been taken'
          }
        ]
      }
      expect(response.code).to eq('400')
      expect(parsed).to eq(expected)
    end

    it 'sends an error if email is missing' do
      params = {
        "name": 'Odell',
        "password": 'treats4lyf',
        "password_confirmation": 'treats4lyf'
      }
      headers = { 'CONTENT_TYPE' => 'application/json' }
      post '/api/v1/users', headers:, params: JSON.generate(params)
      parsed = JSON.parse(response.body, symbolize_names: true)

      expected = {
        errors: [
          {
            status: '400',
            title: "Validation failed: Email can't be blank"
          }
        ]
      }
      expect(response.code).to eq('400')
      expect(parsed).to eq(expected)
    end

    it 'sends an error if name is missing' do
      params = {
        "email": 'goodboy@ruffruff.com',
        "password": 'treats4lyf',
        "password_confirmation": 'treats4lyf'
      }
      headers = { 'CONTENT_TYPE' => 'application/json' }
      post '/api/v1/users', headers:, params: JSON.generate(params)
      parsed = JSON.parse(response.body, symbolize_names: true)

      expected = {
        errors: [
          {
            status: '400',
            title: "Validation failed: Name can't be blank"
          }
        ]
      }
      expect(response.code).to eq('400')
      expect(parsed).to eq(expected)
    end
  end
end
