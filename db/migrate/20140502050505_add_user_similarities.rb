class AddUserSimilarities < ActiveRecord::Migration
  def change
    create_table :similarities do |t|
      t.integer :user1_id, null: false
      t.integer :user2_id, null: false
      t.decimal :similarity
    end
  end
end
