require 'rails_helper'

RSpec.describe "Events", type: :request do
  describe "POST #create" do
    context 'when params are valid' do
      it 'creates a new issue and event' do
        result = lambda do
          post '/events',
            params: {
              action: 'create',
              issue: {
                number: 1,
                repository_url: 'test.url'
              }
            }

            expect(response).to have_http_status(:created)
            expect(response.body).to_not be_empty
            expect(response.content_type).to include 'application/json'
        end

        allow(Rack::Utils).to receive(:secure_compare).and_return(true)

        expect { result.call }
          .to change(Issue, :count).by 1
      end
    end

    context 'when params are not valid' do
      it 'creates a new issue and event' do
        result = lambda do
          post '/events',
            params: {
              action: 'create',
              issue: {
                number: 1,
              }
            }

            expect(response).to have_http_status(:unprocessable_entity)
            expect(response.body).to_not be_empty
            expect(JSON.parse(response.body)["errors"]).to_not be_empty
            expect(response.content_type).to include 'application/json'
        end

        allow(Rack::Utils).to receive(:secure_compare).and_return(true)

        expect { result.call }
          .to change(Issue, :count).by 0
      end
    end
  end
end
