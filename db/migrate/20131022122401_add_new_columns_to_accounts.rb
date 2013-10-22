class AddNewColumnsToAccounts < ActiveRecord::Migration
  def change
    change_table :accounts do |t|
      t.references :shop, index: true
    end
  end
end
