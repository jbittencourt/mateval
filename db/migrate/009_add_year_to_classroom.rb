class AddYearToClassroom < ActiveRecord::Migration
  def self.up
	add_column :classrooms, :year, :integer
  end

  def self.down
	remove_column :classrooms, :year, :integer

  end
end
