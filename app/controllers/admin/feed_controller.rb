class Admin::FeedController < AdminController
  def index
    @feeds = Feed.all
  end

  def edit
    binding.pry
    @feed = Feed.find_by_id(params[:id])
  end

  def update
    
  end

  def destroy
    
  end

  def get_feeds
    Feed.destroy_all
    pages = Page.all
    pages.each do |p|
      p.get_feeds current_admin
    end
  end
end
