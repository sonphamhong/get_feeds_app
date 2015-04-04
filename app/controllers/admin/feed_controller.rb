class Admin::FeedController < AdminController
  def index
    @feeds = Feed.all
  end

  def edit
    @feed = Feed.find_by_id(params[:id])
  end

  def update
    binding.pry
    feed = Feed.find_by_id(params[:id])
    feed.update_attributes(:title => params[:feed][:title], :content => params[:feed][:content]) if feed.present?
    redirect_to admin_feed_index_path
  end

  def destroy
    feed = Feed.find_by_id(params[:id])
    status = "error"
    if feed.present?
      feed.destroy
      status = "ok"  
    end
    respond_to do |format|
      format.json {render json: {status: status}}
    end
  end

  def get_feeds
    Feed.destroy_all
    pages = Page.all
    pages.each do |p|
      p.get_feeds current_admin
    end
  end
  private
    def method_name
      
    end
end
