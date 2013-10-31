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

  scope :my_all_by_type, lambda { |user, type|
    if user.admin?
      all unless user.id.nil?
    else
      where('user_id = ? and type_account_id = ? and date_amount >= ? and date_amount < ?', user.id, type, $global_date.to_date, $global_date_next.to_date) unless user.id.nil?
    end
  }

  scope :my_period, lambda { |user|
    if user.admin?
      all.order('date_amount DESC') unless user.id.nil?
    else
      where('user_id = ? and date_amount >= ? and date_amount < ?', user.id, $global_date.to_date, $global_date_next.to_date).order('date_amount DESC') unless user.id.nil?
    end
  }

end
