class Feed < ActiveRecord::Base
  attr_accessible :content, :created_time, :link, :page_id, :picture, :title, :message, :published
  belongs_to :page
  has_many :article_users, :foreign_key => "article_id", dependent: :destroy
  has_many :users, through: :article_users
end
