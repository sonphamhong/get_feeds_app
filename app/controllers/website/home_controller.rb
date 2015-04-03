class Website::HomeController < WebsiteController
  def index
    @feeds = Feed.all
  end
end
