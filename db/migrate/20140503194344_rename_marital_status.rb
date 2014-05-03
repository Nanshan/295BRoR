class RenameMaritalStatus < ActiveRecord::Migration
  def change
    change_table :profiles do |t|
      t.rename :martial_status, :marital_status
    end
  end
end
