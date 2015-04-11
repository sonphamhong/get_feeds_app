class Admin::PageController < AdminController
  def index
    @pages = Page.all
  end

  def create
    page = Page.create(:page_id => params[:data][:page_id])
    page.update_page_name current_admin
    redirect_to admin_page_index_path
  end

  def new
    @page = Page.new
  end
end
