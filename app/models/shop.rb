class Shop < ActiveRecord::Base
  has_many :accounts
  geocoded_by :address
  after_validation :geocode, :if => :address_changed?

end
