class ArticleUser < ActiveRecord::Base
  attr_accessible :article_id, :user_id
  belongs_to :user
  belongs_to :feed, :foreign_key => "article_id"
end
