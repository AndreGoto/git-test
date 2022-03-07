class Event < ApplicationRecord
  belongs_to :issue

  validates :action, presence: true
  validates :payload, presence: true
end
