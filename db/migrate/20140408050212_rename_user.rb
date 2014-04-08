class RenameUser < ActiveRecord::Migration
  def change
     rename_table :users, :profiles
  end
end
