class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :title
      t.float :amount

      t.timestamps
    end
  end
end
