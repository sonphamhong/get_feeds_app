class AddDisabledToFeed < ActiveRecord::Migration
  def change
    add_column :feeds, :disabled, :boolean, :default => true
  end
end
