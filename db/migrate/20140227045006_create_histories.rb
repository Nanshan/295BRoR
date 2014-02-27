class CreateHistories < ActiveRecord::Migration
  def change
    create_table :histories do |t|
      t.string :userId
      t.string :latitude
      t.string :longitude
      t.string :like

      t.timestamps
    end
  end
end
