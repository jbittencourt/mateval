 class ObjectivesController < ResourceController::Base

	def new
	 
	@objective = Objective.new(params[:objective])
	@objective.user_id = current_user.id
	@objective.classroom_id = params[:id]
	@classroom = Classroom.find(params[:id])
	return unless request.post?
	@objective.save!
	rescue ActiveRecord::RecordInvalid

	render :layout => false
  end

end
