class Page < ActiveRecord::Base
  attr_accessible :page_id, :page_name
  has_many :feed

  def get_feeds current_admin
    @graph = get_fb_graph_api_object current_admin
    feeds = @graph.get_connections("#{self.page_id}", "?fields=feed.limit(100){message,link,picture}")
    feeds["feed"]["data"].each do |feed|
      tmp = feed["message"].split("\n\n")
      title = tmp[0]
      content = tmp[1]
      link = feed["link"]
      picture = feed["picture"]
      created_time = feed["created_time"]
      message = feed["message"]
      self.feed.create(:title => title, :content => content, :link => link, :picture => picture, :created_time => created_time, :message => message, :published => "f") if created_time.to_datetime >= Time.now.beginning_of_day
    end
  end

  def get_fb_graph_api_object current_admin
    begin
      graph = Koala::Facebook::API.new("#{current_admin.access_token.token}")
      graph
    rescue Exception => e
      Rails.logger.info("=======================================> Error while initialise graph object: #{e.message} ")
    end
  end

  def update_page_name current_admin
    @graph = get_fb_graph_api_object current_admin
    profile = @graph.get_connections("#{self.page_id}", "")
    self.update_attributes(:page_name => profile["name"]) if profile.present?
    binding.pry
  end

end
