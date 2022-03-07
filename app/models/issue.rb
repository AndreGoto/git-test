class Issue < ApplicationRecord
  validates :issue_id, presence: true
  validates :repository_url, presence: true
end
