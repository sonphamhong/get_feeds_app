class Like < ActiveRecord::Base
  attr_accessible :feed_id, :user_id
  belongs_to :user
  belongs_to :feed

  def like user, post
    create(:user_id => user.id, :post_id => post.id)
  end

  def unlike 
    destroy
  end
end
