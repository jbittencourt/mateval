class ClassroomsController < ResourceController::Base
	
	def index
		#get all the classrooms relationated whit the user
		@classrooms = current_user.classrooms.find(:all)

		#get distinct years from his classrooms
		@distinct_years = current_user.classrooms.find(:all).map{ |i| i.year }.uniq
#		@distinct_years = []
#			@classrooms.each do |c|
#				if !@distinct_years.include?(c.year) 
#					@distinct_years.push(c)
#				end
#			end
	end
end
