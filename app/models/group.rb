class Group < ActiveRecord::Base
  validates :name, presence: true, length: { maximum: 50 }
  VALID_URL_REGEX = /\A[\w+(\-.|\_.)]/i
  validates :url, presence: true, format: {with: VALID_URL_REGEX }, length: { maximum: 20 }
end