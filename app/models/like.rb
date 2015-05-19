class Like < ActiveRecord::Base
  attr_accessible :feed_id, :user_id
  belongs_to :user
  belongs_to :feed
end
