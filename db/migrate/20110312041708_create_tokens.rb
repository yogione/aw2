class CreateTokens < ActiveRecord::Migration
  def self.up
    create_table :tokens do |t|
      t.column :token, :string, :null => false
      t.column :user_id, :integer
      t.timestamps
    end
  end

  def self.down
    drop_table :tokens
  end
end