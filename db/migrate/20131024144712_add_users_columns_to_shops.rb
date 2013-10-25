class AddUsersColumnsToShops < ActiveRecord::Migration
  def change
    change_table :shops do |t|
      t.references :user, index: true
    end
  end
end
