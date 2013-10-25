class Shop < ActiveRecord::Base
  has_many :accounts
  belongs_to :user
  geocoded_by :address
  after_validation :geocode, :if => :address_changed?

end
