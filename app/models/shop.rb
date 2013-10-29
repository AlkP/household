class Shop < ActiveRecord::Base
  has_many :accounts
  belongs_to :user
  geocoded_by :address
  after_validation :geocode, :if => :address_changed?

  scope :my_all, lambda { |user|
    if user.admin?
      all unless user.id.nil?
    else
      where('user_id = ?', user.id) unless user.id.nil?
    end
  }

end
