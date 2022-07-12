require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    it 'returns the correct response' do
      get '/'
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /show' do
    it 'returns the correct response' do
      get '/users', params: {
        id: 101
      }

      expect(response).to have_http_status(200)
    end
  end
end
