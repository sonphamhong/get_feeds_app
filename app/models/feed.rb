require "open-uri"
class Feed < ActiveRecord::Base
  attr_accessible :content, :created_time, :link, :page_id, :picture, :title, :message, :published, :image
  belongs_to :page
  has_many :article_users, :foreign_key => "article_id", dependent: :destroy
  has_many :users, through: :article_users
  has_many :likes
  has_attached_file :image
  do_not_validate_attachment_file_type :image
  
  def upload_image_feed(url)
    self.image = URI.parse(url)
  end

end
