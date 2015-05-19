class RenameDisabledToFeeds < ActiveRecord::Migration
  def up
    rename_column :feeds, :disabled, :published
  end

  def down
  end
end
