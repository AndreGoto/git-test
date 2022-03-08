require 'rails_helper'

RSpec.describe EventService do
  subject { described_class.call(event_params, issue_params) }

  describe '#call' do
    context 'when params are valid' do
      let(:event_params) do
        {
          "action" => "create",
          "payload_body" => {}
        }
      end
      let(:issue_params) do
        {
          "number" => 1,
          "repository_url" => "repo.url"
        }
      end

      it 'returns no error' do
        expect(subject.errors).to be_empty
      end
    end
  end
end
