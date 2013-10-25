class User < ActiveRecord::Base
  has_many :accounts
  has_many :type_account
  has_many :shops
  has_secure_password
  validates_presence_of :email
  validates_uniqueness_of :email
end
