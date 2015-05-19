class Comment < ActiveRecord::Base
  attr_accessible :feed_id, :user_id, :content
  belongs_to :feed
  belongs_to :user
end
