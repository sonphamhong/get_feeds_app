class Website::HomeController < WebsiteController
  def index
    @feeds = Feed.where(:disabled => "f")
    binding.pry
  end
end
