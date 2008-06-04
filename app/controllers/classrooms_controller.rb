class ClassroomsController < ResourceController::Base
	
	def index
		@classrooms = current_user.classrooms.find(:all)
	end
end
