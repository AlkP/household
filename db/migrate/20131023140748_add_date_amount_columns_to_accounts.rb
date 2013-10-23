class AddDateAmountColumnsToAccounts < ActiveRecord::Migration
  def change
    change_table :accounts do |t|
      t.date :date_amount
    end
  end
end
