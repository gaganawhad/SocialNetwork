class DropColumnOwnerIdFromGroups < ActiveRecord::Migration
  def self.up
    remove_column :groups, :owner_id,
  end

  def self.down
    add_column :groups, :owner_id, :integer
  end
end
