class Website::ArticesController < WebsiteController
  def show
    @artice = Feed.find_by_id(params[:id])
  end
end
