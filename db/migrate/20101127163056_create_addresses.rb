class CreateAddresses < ActiveRecord::Migration
  def self.up
    create_table :addresses do |t|
      t.string :line_1, :limit => 20
      t.string :line_2, :limit => 20
      t.string :city, :limit => 20
      t.string :state, :limit =>2
      t.string :zip, :limit =>5

      t.timestamps
    end
  end

  def self.down
    drop_table :addresses
  end
end
