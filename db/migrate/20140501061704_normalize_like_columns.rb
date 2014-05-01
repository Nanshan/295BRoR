class NormalizeLikeColumns < ActiveRecord::Migration
  def change
    remove_column :histories, :dislike
  end
end
