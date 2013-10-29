class Account < ActiveRecord::Base
  validates_presence_of :title
  validates_presence_of :amount
  belongs_to :shop
  belongs_to :user
  belongs_to :type_account

  scope :my_all, lambda { |user|
    if user.admin?
      all unless user.id.nil?
    else
      where('user_id = ?', user.id) unless user.id.nil?
    end
  }

end
