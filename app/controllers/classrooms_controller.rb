class ClassroomsController < ResourceController::Base
  before_filter :login_required
  access_control [:create, :new, :edit ,:manager, :atrib_classrooms] => '(admin)'	
  
  def index
  		 
     #get all the classrooms fom the user
  	  #classrooms = current_user.classrooms.find(:all)
	if (params[:year] != nil) && (params[:year].strip != "")
  		classrooms = current_user.classrooms.find(:all, :conditions=> "year=	#{params[:year]}").paginate :page=> params[:page], :order => 'updated_at DESC', :per_page => 2
	else
		classrooms = current_user.classrooms.paginate :page=> params[:page], :order => 'updated_at DESC', :per_page => 2
	end
     #@posts = Post.paginate_by_board_id @board.id, :page => params[:page], :order => 'updated_at DESC'

    #get distinct years from his classrooms
    @distinct_years = current_user.classrooms.find(:all).map{ |i| i.year }.uniq
    
    @datagrid = { 
      :title => 'Turmas', 
      :list => classrooms,
      :header => %w(Nome),
      :fields => %w(name),
      :actions => %w(objectives),
      :action_buttons => ["select_year(@distinct_years,'index')"]
    }

  end
  
  def objectives
	
    classroom = Classroom.find(params[:id])
	 objectives = classroom.objectives.paginate :page=> params[:page], :order => 'updated_at DESC', :per_page => 2
	 
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
	
	if (params[:year] != nil) && (params[:year].strip != "")
		classroom = Classroom.find(:all,:conditions=> " year=	#{params[:year]}" ).paginate(:page=> params[:page], :order => 'updated_at DESC', :per_page => 2)
	else
		classroom = Classroom.paginate(:page=> params[:page], :order => 'updated_at DESC', :per_page => 2)
	end
		place = "manager"
    @datagrid = { 
      :title => 'Administração de Turmas', 
      :list => classroom,
      :header => %w(Nome Ano),
      :fields => %w(name year),
      :actions => %w(edit delete),
      :action_buttons => ["select_year(@distinct_years,'manager')", 'add']
    }

    
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
    @students = Student.find(:all, :conditions=> " classroom_id=	#{params[:id]}")
    render :layout => false
  end
  
  def update_objectives
  
     #get all the classrooms fom the select year, or all of it
     if params[:year] == ""
     		classrooms = current_user.classrooms.paginate :page=> params[:page], :order => 'updated_at DESC', :per_page => 2
     		params[:year] = "nil"
     else
    		classrooms = current_user.classrooms.find(:all, :conditions=> "year=#{params[:year]}" ).paginate :page=> params[:page], :order => 'updated_at DESC', :per_page => 2
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
  	if (params[:year] != nil) && (params[:year].strip != "")
     classroom = Classroom.find(:all,:conditions=> " year=	#{params[:year]}" ).paginate(:page=> params[:page], :order => 'updated_at DESC', :per_page => 2)
	else
  		classroom = Classroom.paginate :page=> params[:page], :order => 'updated_at DESC', :per_page => 2
    end 
    @distinct_years = Classroom.find(:all).map{ |i| i.year }.uniq
    
    @datagrid = { 
      :title => 'Turmas', 
      :list => classroom,
      :header => %w(Nome),
      :fields => %w(name),
      :actions => %w(atrb),
      :action_buttons => ["select_year(@distinct_years,'atrib_classrooms')"]
    }

  end
  
end
