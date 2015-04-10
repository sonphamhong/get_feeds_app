class Users::ProfileController < ApplicationController

  def save_article_to_user
    article = Feed.find_by_id(params[:id])
    binding.pry
    if current_user && article.present?
      current_user.article_users.create(:user_id => current_user.id, :article_id => article.id)
      message = "OK"
    else
      message = "Error"
    end
    respond_to do |format|
      format.json {render json: {result:message}}
    end
  end
end
