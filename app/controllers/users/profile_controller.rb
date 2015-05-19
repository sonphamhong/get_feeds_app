class Users::ProfileController < WebsiteController

  before_filter :authenticate_user!
  def save_article_to_user
    article = Feed.find_by_id(params[:id])
    if current_user && article.present? && (!current_user.feeds.exists? article)
      current_user.article_users.create(:user_id => current_user.id, :article_id => article.id)
      message = "OK"
    else
      message = "Error"
    end
    respond_to do |format|
      format.json {render json: {result:message}}
    end
  end

  def index
    @users = User.all
  end
  
  def follow
    @user = User.find_by_id(params[:user])
    current_user.follow @user if @user.present?
  end

  def unfollow
    @user = User.find_by_id(params[:user])
    current_user.unfollow @user if @user.present?
  end
  
  def show
    @articles = current_user.feeds
  end

  def delete_article_user
    article = current_user.article_users.where(:article_id => params[:id])
    if article.present?
      article.destroy_all
      message = "ok"
    else
      message = "error"
    end
    respond_to do |format|
      format.json {render json: {result: message}}
    end
  end
end
