class ArticleUser < ActiveRecord::Base
  attr_accessible :article_id, :user_id
  belongs_to :user
  belongs_to :feed
end
