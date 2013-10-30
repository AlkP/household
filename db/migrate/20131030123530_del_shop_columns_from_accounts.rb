class DelShopColumnsFromAccounts < ActiveRecord::Migration
  def self.up
    remove_column :accounts, :shop_id
  end
end
