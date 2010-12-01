class AddOwnerColumnToMembership < ActiveRecord::Migration
  def self.up
    add_column :memberships, :owner, :boolean, 
  end

  def self.down
    remove_column :memberships, :owner
  end
end
