class CreateClassrooms < ActiveRecord::Migration
  def self.up
    create_table :classrooms, :force => true do |t|
      t.string :name
      
      t.timestamps
    end
  end

  def self.down
    drop_table :classrooms
  end
end
