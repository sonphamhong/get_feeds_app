class Admin::FeedController < ApplicationController
  def index
    @feeds = Feed.all
    binding.pry
  end

  def get_feeds
    Feed.destroy_all
    pages = Page.all
    pages.each do |p|
      p.get_feeds current_admin
    end
  end
end
