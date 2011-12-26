class AddVoteToItems < ActiveRecord::Migration
  def self.up
    add_column :items, :up_votes, :integer, :default => 0
    add_column :items, :down_votes, :integer, :default => 0
  end

  def self.down
    remove_column :items, :up_votes
    remove_column :items, :down_votes
  end
end
