 class ObjectivesController < ResourceController::Base

	def newobj
	
		render :layout => false	 
	end
	
	def create
		@objective = Objective.new(params[:objective])
		@objective.user_id = current_user.id
		@objective.classroom_id = params[:id]
		@objective.save!
		redirect_to :controller => 'classrooms', :action => 'objectives', :id => params[:id]
	end
	
	def delete
		obj = Objective.find(params[:id])
		obj.destroy
		redirect_to :controller => 'classrooms', :action => 'objectives', :id => params[:classroom_id]
  end
  
  
  def edit
    @obj = Objective.find(params[:id])
    render :layout => false
  end
  
  def update_obj
    obj = Objective.find(params[:id])
    obj.name = params[:objective][:name]
    obj.objective = params[:objective][:objective]
    obj.save
    redirect_to :controller => 'classrooms', :action => 'objectives', :id => params[:classroom_id]
  end
  
end
