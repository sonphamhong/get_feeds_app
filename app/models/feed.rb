class Feed < ActiveRecord::Base
  attr_accessible :content, :created_time, :link, :page_id, :picture, :title, :message
  belongs_to :page
end
