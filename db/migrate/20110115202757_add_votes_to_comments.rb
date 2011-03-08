class AddVotesToComments < ActiveRecord::Migration
  def self.up
    add_column :comments, :votes, :integer
  end

  def self.down
    remove_column :comments, :votes
  end
end
