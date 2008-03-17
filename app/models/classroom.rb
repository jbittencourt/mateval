class Classroom < ActiveRecord::Base
  has_and_belongs_to_many :diario_de_classe_posts
  has_and_belongs_to_many :students

def list_students
	#find all students id
	students_ids = StudentClassroom.find(:all, :conditions => "classroom_id = " self.id.to_s )

	#for each id list the username
	students_ids.each do |s_id|
		student = Student.find(:all, :conditions => "id =" s_id.id.to_s)
		student.each do |stu|
			y stu.name
		end
	end
end

end
