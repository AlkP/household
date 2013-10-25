class AddTypeAccountsColumnsToAccounts < ActiveRecord::Migration
  def change
    change_table :accounts do |t|
      t.references :type_account, index: true
    end
  end
end
