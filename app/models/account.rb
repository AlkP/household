class Account < ActiveRecord::Base
  validates_presence_of :title
  validates_presence_of :amount
  belongs_to :shop
  belongs_to :user
  belongs_to :type_account
end
