require 'rails_helper'

RSpec.describe Issue, type: :model do
  it "is not valid without a issue_id" do
    issue = Issue.new(issue_id: nil, repository_url: 'test.ul')
    expect(issue).to_not be_valid
  end

  it "is not valid without a repository_url" do
    issue = Issue.new(issue_id: 1, repository_url: nil)
    expect(issue).to_not be_valid
  end

  it "is valid with a repository_url and issue_id" do
    issue = Issue.new(issue_id: 1, repository_url: 'test.url')
    expect(issue).to be_valid
  end
end
