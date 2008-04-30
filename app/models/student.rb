class Student < ActiveRecord::Base
  has_many :evaluations
  
  # OLD relationships
  #has_and_belongs_to_many :classrooms
  #as_and_belongs_to_many :diario_de_classe_posts
  
  #returns all posts from a student
  def list_student_diario_de_classe_posts
   
    #return DiarioDeClassePost.find_by_sql("select * from diario_de_classe_posts posts left join diario_de_classe_posts_students rel1 ON posts.id = rel1.diario_de_classe_post_id where posts.user_id <> #{User.current_user.id}")

    return DiarioDeClassePost.find_by_user_id(User.current_user.id)
  end
end
