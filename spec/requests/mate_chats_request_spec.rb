require 'rails_helper'

RSpec.describe 'MateChats', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/mate_chats/index'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /create' do
    it 'returns http success' do
      get '/mate_chats/create'
      expect(response).to have_http_status(:success)
    end
  end
end
