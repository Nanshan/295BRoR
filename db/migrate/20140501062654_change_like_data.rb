class ChangeLikeData < ActiveRecord::Migration
  def change
    @likes = History.where("\"like\" = ?", 'like')
    @likes.each do |like|
      like.like = '1'
      like.save
    end
    @dislikes = History.where("\"like\" = ?", 'dislike')
    @dislikes.each do |dislike|
      dislike.like = '-1'
      dislike.save
    end

  end
end
