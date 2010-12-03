class RenameFriendshipColumns < ActiveRecord::Migration
  def self.up
    rename_column :friendships, :initiator_id, :user_id
    rename_column :friendships, :acceptor_id, :friend_id
  end

  def self.down
    rename_column :friendships, :friend_id, :acceptor_id
    rename_column :friendships, :user_id, :initiator_id
  end
end
