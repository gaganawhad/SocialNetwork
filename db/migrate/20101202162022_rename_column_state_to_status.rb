class RenameColumnStateToStatus < ActiveRecord::Migration
  def self.up
    rename_column :friendships, :state, :status
  end

  def self.down
    rename_column :friendships, :status, :state
  end
end
