class ChangeLoginForUsername < ActiveRecord::Migration
  def self.up
	remove_column :users, :login
	add_column :users, :username, :string
  end

  def self.down
	add_column :users, :login, :string
	remove_column :users, :username, :string

  end
end
