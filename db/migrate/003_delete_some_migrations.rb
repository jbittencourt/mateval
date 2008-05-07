class DeleteSomeMigrations < ActiveRecord::Migration
  def self.up
    
    # deleting those tables envisions to help us create a better relationship later 
    drop_table :diario_de_classe_posts
    drop_table :subjects
    drop_table :classrooms
    
 
  end

  def self.down
     create_table "subjects", :force => true do |t|
        t.string   :name
        t.timestamps      
      end
      
      create_table "classrooms", :force => false do |t|
          t.string   :name
          t.timestamps      
      end
      create_table "diario_de_classe_posts", :force => true do |t|      
        t.string   :title
        t.string   :body
        t.integer  :user_id
        t.timestamps
      end
    
  end
end
