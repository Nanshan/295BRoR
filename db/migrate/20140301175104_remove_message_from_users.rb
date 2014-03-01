class RemoveMessageFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :message, :string
  end
end
