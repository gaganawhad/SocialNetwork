class AddColumnStatusToMembership < ActiveRecord::Migration
  def self.up
    add_column :memberships, :status, :string
  end

  def self.down
    remove_column :memberships, :status
  end
end
