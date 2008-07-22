class DiarioDeClassePostsController < ResourceController::Base
  
  before_filter :login_required

  def index
    @diario_de_classe_posts = DiarioDeClassePost.find(:all, :conditions => "user_id = "+current_user.id.to_s, :order => "created_at DESC").paginate(:page=> params[:page], :order => 'updated_at DESC', :per_page => 2)
  end
  
  def create
    
    post_p = params[:diario_de_classe_post]
    
    post = DiarioDeClassePost.new
    post.title = post_p[:title]
    post.body = post_p[:body]
    post.user_id = current_user.id
    post.classroom_id = post_p[:classroom]
    post.student_id = post_p[:student]
    post.save
    redirect_to :controller => 'diario_de_classe_posts', :action => 'index'

  end

  def list_classrooms
    #@classrooms = current_user.classrooms.find(:all)
  end
  
  def new 
    @classrooms = current_user.classrooms.find(:all)
  end
  
  def show
  		@diario_de_classe_post = DiarioDeClassePost.find(params[:id])
  	
  		@classroom = Classroom.find(@diario_de_classe_post.classroom_id)
  	
  		if @diario_de_classe_post.student_id != nil
  			@student = Student.find(@diario_de_classe_post.student_id)
  		else
  			@student = nil
  		end
  		
  end
  	
  
  def edit
  
  		@diario_de_classe_post = DiarioDeClassePost.find(params[:id])
  		@classrooms = current_user.classrooms.find(:all)
  		@classroom = Classroom.find(@diario_de_classe_post.classroom_id)

  		#if @diario_de_classe_post.student_id != nil
  			@student = Student.find(:all, :conditions=> " classroom_id=	#{@diario_de_classe_post.classroom_id}")
  	
  end
  
  def update

    post_p = params[:diario_de_classe_post]
    
    post = DiarioDeClassePost.find(params[:id])
    
    post.title = post_p[:title]
    post.body = post_p[:body]
    post.user_id = current_user.id
    post.classroom_id = post_p[:classroom_id]
    post.student_id = post_p[:student_id]
    post.save
    redirect_to :controller => 'diario_de_classe_posts', :action => 'index'

  end
end
