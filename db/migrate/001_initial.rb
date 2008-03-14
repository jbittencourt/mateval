class Initial < ActiveRecord::Migration
  def self.up
    create_table "users", :force => true do |t|
      t.string  :name,  :null => false
      t.string  :username, :email
      t.string  :salt, :crypted_password, :limit => 40
      t.string  :school, :city
      t.string  :state, :limit => 3
      t.timestamps      
    end
    
    # defines a has_and_belongs_to_many relation 
    create_table "users_classrooms", :id => false , :force => true do |t|      
      t.integer  :user_id
      t.integer  :classroom_id
    end
    
    
    create_table "students", :force => true do |t|
      t.string  :name,  :null => false
      t.string  :picture
      t.string  :amadis_username
      t.string  :email, :city, :state, :cep, :state
      t.integer :transfered, :limit => 1
      t.text    :obs
      t.timestamps      
    end
    
    # defines a has_and_belongs_to_many relation 
    create_table "students_classrooms", :id => false , :force => true do |t|      
      t.integer  :student_id
      t.integer  :classroom_id  
    end
    
    
    create_table "classrooms", :force => true do |t|      
      t.string   :name
      t.string   :grade
      t.string   :year    
    end
    
    create_table "diario_de_classe_posts", :force => true do |t|      
      t.string   :title
      t.string   :body
      t.integer  :user_id
      t.timestamps
    end
  
    #TODO: we need to define the table columns
    create_table "parameters", :force => true do |t|      

    end
    
    # defines a has_and_belongs_to_many relation 
    create_table "diario_de_classe_posts_parameters", :id => false , :force => true do |t|      
      t.integer  :parameter_id
      t.integer  :diario_de_classe_post_id
    end

    # defines a has_and_belongs_to_many relation 
    create_table "classrooms_parameters", :id => false , :force => true do |t|      
      t.integer  :parameter_id
      t.integer  :classroom_id
    end

    # defines a has_and_belongs_to_many relation 
    create_table "classrooms_diario_de_classe_posts", :id => false , :force => true do |t|      
      t.integer  :diario_de_classe_post_id
      t.integer  :classroom_id
    end

    # defines a has_and_belongs_to_many relation 
    create_table "students_diario_de_classe_posts", :id => false , :force => true do |t|      
      t.integer  :diario_de_classe_post_id
      t.integer  :student_id
    end


  end
  def self.down
    drop_table "users"
    drop_table "users_subscribes"
    drop_table "students"
    drop_table "students_classrooms"
    drop_table "classrooms"
    drop_table "diario_de_classe_posts"
    drop_table "parameters"
    drop_table "diario_de_classe_posts_parameters"
    drop_table "classrooms_parameters"
    drop_table "classrooms_diario_de_classe_posts"
    drop_table "students_diario_de_classe_posts"
  end
end
