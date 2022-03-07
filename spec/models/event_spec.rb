require 'rails_helper'

RSpec.describe Event, type: :model do
  let(:issue) { Issue.create(issue_id: 1, repository_url: 'issue.url') }

  it "is not valid without a issue" do
    event = Event.new(issue: nil, action: 'create', payload: '{}')
    expect(event).to_not be_valid
  end

  it "is not valid without a action" do
    event = Event.new(issue: issue, action: nil, payload: '{}')
    expect(event).to_not be_valid
  end

  it "is not valid without a payload" do
    event = Event.new(issue: issue, action: 'create', payload: nil)
    expect(event).to_not be_valid
  end

  it "is valid with all params" do
    event = Event.new(issue: issue, action: 'create', payload: '{}')
    expect(event).to be_valid
  end
end
