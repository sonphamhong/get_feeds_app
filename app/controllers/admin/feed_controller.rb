class Admin::FeedController < AdminController
  def index
    @feeds = Feed.all
  end

  def edit
    @feed = Feed.find_by_id(params[:id])
  end

  def update
    feed = Feed.find_by_id(params[:id])
    feed.update_attributes(params[:feed]) if feed.present?
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

  def get_access_token_facebook
    binding.pry
    unless current_admin.access_token
      @oauth = Koala::Facebook::OAuth.new("827044080708654", "0c8efa92470219bd4104f45351688460", "http://#{request.host}:#{request.port}/admin/callback")
      session["oauth_obj"] = @oauth
      redirect_to @oauth.url_for_oauth_code
    else
      redirect_to admin_home_path
    end
  end

  def callback
    binding.pry
    unless current_admin.access_token
      @oauth = session["oauth_obj"]
      AccessToken.create({:token => @oauth.get_access_token(params[:code]), :user_id => current_admin.id})
      redirect_to admin_home_path
    else
      redirect_to admin_home_path
    end
  end
  private
    def method_name
      
    end
end
