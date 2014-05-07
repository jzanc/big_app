class Group < ActiveRecord::Base
  before_save { self.url = url.downcase }
  before_save { self.name = name.downcase }
  validates :name, presence: true, length: { maximum: 50 }, uniqueness: {case_sensitive: false }
  VALID_URL_REGEX = /\A[\w+(\-.|\_.)]/i
  validates :url, presence: true, format: {with: VALID_URL_REGEX }, length: { maximum: 20 },
                  uniqueness: {case_sensitive: false }
end
