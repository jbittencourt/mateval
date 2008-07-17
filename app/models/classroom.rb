class Classroom < ActiveRecord::Base
  
  belongs_to :subject
  has_and_belongs_to_many :users

  has_and_belongs_to_many :students
  has_many :diario_de_classe_posts
  has_many :objectives 
  has_many :students

  # TODO: deprecated, maybe needs refactoring
  def list_students_by(year=Date.today.to_s[0,4])
		#pesquisar por ano e depois pedir os alunos

		classroom = Classroom.find(:first, :conditions => "year='#{year}' AND name='#{self.name}'" )		
		return classroom.students
	end

	def self.list_invalid_classrooms 

		today = Date.today.to_s
		current_year = today[0,4]
		return Classroom.find(:all, :conditions => "year <= " << current_year)
		#valid_class.each do |vc|
		#	y vc.name
		#end
	end
  
end
