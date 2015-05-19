class CommentsController < ApplicationController
  def create
    @post = Feed.find_by_id(params[:comment][:post_id])
    current_user.comment(@post, params[:comment][:content])
    redirect_to website_article_path(@post)
  end
end
