class Users::ProfileController < WebsiteController

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
end
