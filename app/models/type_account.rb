class TypeAccount < ActiveRecord::Base
  belongs_to :user
  has_many :accounts

  scope :my_all, lambda { |user|
    if user.admin?
      all unless user.id.nil?
    else
      where('user_id = ?', user.id).order('id ASC') unless user.id.nil?
    end
  }

end
