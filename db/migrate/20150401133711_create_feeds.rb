class CreateFeeds < ActiveRecord::Migration
  def change
    create_table :feeds do |t|
      t.string :title
      t.string :content
      t.string :link
      t.string :picture
      t.datetime :created_time
      t.integer :page_id

      t.timestamps
    end
  end
end
