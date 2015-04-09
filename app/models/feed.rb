class Feed < ActiveRecord::Base
  attr_accessible :content, :created_time, :link, :page_id, :picture, :title, :message, :disabled
  belongs_to :page
  has_many :article_user
  has_many :user, :through => :article_user
end
