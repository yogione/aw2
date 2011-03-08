class CreateStories < ActiveRecord::Migration
  def self.up
    create_table :stories do |t|
      t.string :title
      t.string :teaser
      t.string :url
      t.integer :user_id
      t.integer :votes
      t.string :photo_path1
      t.string :video_path1

      t.timestamps
    end
  end

  def self.down
    drop_table :stories
  end
end
