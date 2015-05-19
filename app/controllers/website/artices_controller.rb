class Website::ArticesController < WebsiteController
  def show
    @artice = Feed.find_by_id(params[:id])
    @comments = @artice.comments.order("created_at desc")
    @comment = Comment.new
  end
end
