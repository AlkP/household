class TypeAccount < ActiveRecord::Base
  belongs_to :user
  has_many :accounts
end
