class Admin::HomeController < AdminController
  def index
    @graph = Koala::Facebook::API.new("#{current_admin.access_token.token}")
    feeds = @graph.get_connections("511088052277392", "?fields=feed.limit(100){message,link,picture}")
    Feed.destroy_all
    feeds["feed"]["data"].each do |feed|
      tmp = feed["message"].split("\n\n")
      title = tmp[0]
      content = tmp[1]
      link = feed["link"]
      picture = feed["picture"]
      created_time = feed["created_time"]
      message = feed["message"]
      Feed.create(:title => title, :content => content, :link => link, :picture => picture, :created_time => created_time, :message => message)
    end
  end
end
