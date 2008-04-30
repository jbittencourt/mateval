class DatabaseRedesign < ActiveRecord::Migration
  def self.up    
    create_table "evaluations", :force => true do |t|
      t.integer :student_id
      t.integer :parameter_id
      t.integer :planning_id
      t.timestamps      
    end
    create_table "plannings", :force => true do |t|
      t.integer :subject_id
      t.integer :parameter_id
      t.integer :classroom_id
      t.integer :user_id
      t.timestamps      
    end

    create_table "subjects", :force => true do |t|
      t.string   :name
      t.timestamps      
    end
    
    create_table "classrooms", :force => false do |t|
      t.string   :name
      t.timestamps      
    end
    

  end

  def self.down
    drop_table "evaluations"
    drop_table "plannings"
    drop_table "subjects"
  end
end
