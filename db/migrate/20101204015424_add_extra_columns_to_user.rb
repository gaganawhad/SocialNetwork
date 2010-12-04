class AddExtraColumnsToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :phone_number, :string
    add_column :users, :movies, :string
    add_column :users, :books, :string
    add_column :users, :life_status, :string
  end

  def self.down
    remove_column :users, :life_status
    remove_column :users, :books
    remove_column :users, :movies
    remove_column :users, :phone_number
  end
end
