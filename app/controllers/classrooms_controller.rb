class ClassroomsController < ResourceController::Base
  before_filter :login_required
  access_control [:create, :new, :edit ,:manager] => '(admin)'	
  
  def index
  
     #get all the classrooms fom the user
  		classrooms = current_user.classrooms.find(:all)
     
    #get distinct years from his classrooms
    @distinct_years = current_user.classrooms.find(:all).map{ |i| i.year }.uniq
    
    @datagrid = { 
      :title => 'Turmas', 
      :list => classrooms,
      :header => %w(Nome),
      :fields => %w(name),
      :actions => %w(objectives),
      :action_buttons => ['select_year(@distinct_years,nil)']
    }

  end
  
  def objectives
	
    classroom = Classroom.find(params[:id])
	 objectives = classroom.objectives
    @datagrid = { 
      :title => 'Objetivos para turma ' + classroom.name, 
      :list => objectives,
      :header => %w(Criador Nome Turma Data),
      :fields => %w(name name turma date-limit),
      :actions => %w(edit_obj delete_obj),
      :action_buttons => ['add_obj']
    }
	 # render :layout => false
  end

  def manager
    @distinct_years = Classroom.find(:all).map{ |i| i.year }.uniq
    @datagrid = { 
      :title => 'Administração de Turmas', 
      :list => Classroom.find(:all),
      :header => %w(Nome Ano),
      :fields => %w(name year),
      :actions => %w(edit delete),
      :action_buttons => ['select_year(@distinct_years,nil)', 'add']
    }
    
   def update_classrooms
   	render :text=>"YAARRR!"
   end
    
  end
  
  def create
    classroom = Classroom.new
    classroom.name = params[:classroom][:name]
    classroom.year = params[:classroom][:year] #Date.today.to_s[0,4]
    classroom.save
    redirect_to :controller => 'classrooms', :action => 'manager'
  end
    
  def edit
    @classroom = Classroom.find(params[:id])
    render :layout => false
  end
  
  def update
    classroom = Classroom.find(params[:id])
    classroom.name = params[:classroom][:name]
    classroom.year = params[:classroom][:year]
    classroom.save
    redirect_to :controller => 'classrooms', :action => 'manager'
  end
  
  def delete
    classroom = Classroom.find(params[:id])
    classroom.destroy
    redirect_to :controller => 'classrooms', :action => 'manager'
  end
  
  def new
    render :layout => false
  end
  
  def list_students
    @classroom = Classroom.find(params[:id])
    render :layout => false
  end
  
  def update_objectives
  
     #get all the classrooms fom the select year, or all of it
     if params[:year] == ""
     		classrooms = current_user.classrooms.find(:all)
     		params[:year] = "nil"
     else
    		classrooms = current_user.classrooms.find(:all, :conditions=> "year=#{params[:year]}" )
     end
     
     
    #get distinct years from his classrooms
    @distinct_years = current_user.classrooms.find(:all).map{ |i| i.year }.uniq
    
    @datagrid = { 
      :title => 'Turmas', 
      :list => classrooms,
      :header => %w(Nome),
      :fields => %w(name),
      :actions => %w(objectives),
      :action_buttons => ['select_year(@distinct_years,'+params[:year]+')']
    }
	render :layout => false
  end
  
  
  def list_users
  		
  		cr = Classroom.find(params[:id])
  		@users_assigned = cr.users
  		@users = User.find(:all)
  		render :layout => false

  end
 		
  def assign
  
		cr = Classroom.find(params[:id])
		cr.users << User.find(params[:uid])
		render :partial => "assign", :layout => false, :uid => params[:uid], :id => params[:id]
		
		#respond_to do |format|
		#render :update do |page|
		#	format.js {
		#		page.replace_html "toggle#{params[:uid]}", :partial => "assign", :uid => u.id, :id => params[:id]
		#	}
		#	end
		#end
		
  end 
  
  def unassign
  
		cr = Classroom.find(params[:id])
		cr.users.delete(User.find(params[:uid]))
		render :partial => "unassign", :layout => false, :uid => params[:uid], :id => params[:id] 
		
		#respond_to do |format|
		#render :update do |page|
		#	format.js {
		#		page.replace_html "toggle#{params[:uid]}", :partial => "unassign"
		#	}
		#end
		#end

		
  end
  
  
  def atrib_classrooms
  
     #get all the classrooms fom the user
  		classrooms = Classroom.find(:all)
     
    #get distinct years from his classrooms
    @distinct_years = Classroom.find(:all).map{ |i| i.year }.uniq
    
    @datagrid = { 
      :title => 'Turmas', 
      :list => classrooms,
      :header => %w(Nome),
      :fields => %w(name),
      :actions => %w(atrb),
      :action_buttons => ['select_year(@distinct_years,nil)']
    }

  end
  
end
