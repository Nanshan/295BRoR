class RenameLogin < ActiveRecord::Migration
  def change
    rename_table :logins, :users
  end
end
