class Website::HomeController < WebsiteController
  def index
    @feeds = Feed.where(:published => "t")
  end
end
