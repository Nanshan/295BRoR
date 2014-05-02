class AddIndexes < ActiveRecord::Migration
  def change
    change_table :similarities do |t|
      t.index :user1_id
      t.index :user2_id
    end
  end
end
