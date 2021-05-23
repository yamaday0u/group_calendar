require 'rails_helper'

RSpec.describe 'Api::V1::Rooms', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/api/v1/rooms/index'
      expect(response).to have_http_status(:success)
    end
  end
end
