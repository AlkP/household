class AddUsersColumnsToTypeAccounts < ActiveRecord::Migration
  def change
    change_table :type_accounts do |t|
      t.references :user, index: true
    end
  end
end
