class AddMessageToFeeds < ActiveRecord::Migration
  def change
    add_column :feeds, :message, :string
  end
end
