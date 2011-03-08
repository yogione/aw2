class CreateRetirees < ActiveRecord::Migration
  def self.up
    create_table :retirees do |t|
      t.integer :user_id
      t.string :first_name
      t.string :last_name
      t.integer :years_worked
      t.string :plant
      t.string :pet_story
      t.string :what_are_you_doing
      t.string :photo_path1
      t.string :video_path1
      t.string :message_to_ceo

      t.timestamps
    end
  end

  def self.down
    drop_table :retirees
  end
end
