class CreateAclSchema < ActiveRecord::Migration
  def self.up
    create_table :roles do |t|
      t.column :name, :string, :limit=>40, :null=>false
      t.column :info, :string, :limit=>80
    end
    create_table :permissions do |t|
      t.column :name, :string, :limit=>40, :null=>false  
      t.column :info, :string, :limit=>80
    end
    create_table :roles_users, :id => false do |t|
      t.column :user_id, :integer, :null=>false
      t.column :role_id, :integer, :null=>false
    end
    create_table :permissions_roles, :id => false do |t|
      t.column :role_id, :integer, :null=>false
      t.column :permission_id, :integer, :null=>false
    end
  end

  def self.down
    drop_table :roles
    drop_table :permissions
    drop_table :roles_users
    drop_table :permissions_roles
  end
end
