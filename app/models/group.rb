class Group < ActiveRecord::Base
  has_many :microposts
  before_save { self.url = self.name }
  before_save { self.url = url.downcase }
  before_save { self.url = url.gsub(/^(\w+\-\_)/,"") }

  validates :name, presence: true, length: { maximum: 50 }, uniqueness: {case_sensitive: false }
  
end
