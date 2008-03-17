class Student < ActiveRecord::Base
  has_and_belongs_to_many :classrooms
  has_and_belongs_to_many :diario_de_classe_posts
  
  #returns the student posts NOT created by the current logged user
  def list_student_diario_de_classe_posts
    #TODO: query classrooms table
    return DiarioDeClassePost.find_by_sql("select * from diario_de_classe_posts posts left join diario_de_classe_posts_students rel1 ON posts.id = rel1.diario_de_classe_post_id where posts.user_id <> #{User.current_user.id}")

  end
end
