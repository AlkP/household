class AddUserColumnsToAccounts < ActiveRecord::Migration
  def change
    change_table :accounts do |t|
      t.references :user, index: true
    end
  end
end
