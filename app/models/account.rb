class Account < ActiveRecord::Base
  validates_presence_of :title
  validates_presence_of :amount
  belongs_to :shop
end
