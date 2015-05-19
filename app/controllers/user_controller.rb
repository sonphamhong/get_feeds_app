class UserController < ApplicationController
  def like
    @feed = Feed.find_by_id(params[:post_id])
    current_user.like(@feed)
  end

  def unlike
    @feed = Feed.find_by_id(params[:post_id])
    current_user.unlike(@feed)
  end
end
