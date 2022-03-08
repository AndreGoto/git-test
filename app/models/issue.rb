class Issue < ApplicationRecord
  validates :issue_id, presence: true, uniqueness: true
  validates :repository_url, presence: true
end
