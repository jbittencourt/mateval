class ClassroomsController < ResourceController::Base
  before_filter :login_required
  access_control [:create, :new, :edit ,:manager] => '(admin)'	
  
  def index
    #get all the classrooms relationated whit the user
    classrooms = current_user.classrooms.find(:all)
    
    #get distinct years from his classrooms
    @distinct_years = current_user.classrooms.find(:all).map{ |i| i.year }.uniq
    
    @datagrid = { 
      :title => 'Turmas', 
      :list => classrooms,
      :header => %w(Nome),
      :fields => %w(name),
      :actions => %w(objectives),
      :action_buttons => ['select_year(@distinct_years)']
    }
    #		@distinct_years = []
    #			@classrooms.each do |c|
    #				if !@distinct_years.include?(c.year) 
    #					@distinct_years.push(c)
    #				end
    #			end
  end
  
  def objectives
	
    classroom = Classroom.find(params[:id])
	 objectives = classroom.objectives
    @datagrid = { 
      :title => 'Objetivos para turma ' + classroom.name, 
      :list => objectives,
      :header => %w(Criador Nome Turma Data),
      :fields => %w(name name turma limit ),
      :actions => %w(objectives),
      :action_buttons => ['add_obj']
    }
	  render :layout => false
  end

  def manager
    @distinct_years = Classroom.find(:all).map{ |i| i.year }.uniq
    @datagrid = { 
      :title => 'Administração de Turmas', 
      :list => Classroom.find(:all),
      :header => %w(Nome Ano),
      :fields => %w(name year),
      :actions => %w(edit delete),
      :action_buttons => ['select_year(@distinct_years)', 'add']
    }
    
  end
  
  #  def create
  #    if !params[:name].nil?
  #      classroom = Classroom.new
  #      classroom.name = params[:name]
  #      classroom.year = params[:year] #Date.today.to_s[0,4]
  #      classroom.save
  #      redirect_to :action => 'manager'
  #    else
  #      redirect_to :action => 'new'
  #    end
  #  end
  
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
end
