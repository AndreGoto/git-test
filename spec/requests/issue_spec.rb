require 'rails_helper'

RSpec.describe "Issues", type: :request do
  before do
    allow(Rack::Utils).to receive(:secure_compare).and_return(true)
  end

  describe "GET #events" do
    before do
      get '/issues/1/events', params: {}
    end

    it 'returns success' do
      expect(response).to have_http_status(:ok)
    end

    it 'returns body' do
      expect(JSON.parse(response.body)["events"]).to be_empty
    end
  end
end
