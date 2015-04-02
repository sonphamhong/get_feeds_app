class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.integer :page_id
      t.string :page_name

      t.timestamps
    end
  end
end
