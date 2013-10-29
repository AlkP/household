class AddMainColumnsToTypeAccounts < ActiveRecord::Migration
  def change
    change_table :type_accounts do |t|
      t.boolean :main
    end
  end
end
