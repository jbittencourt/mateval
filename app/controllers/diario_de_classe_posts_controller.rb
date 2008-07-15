class DiarioDeClassePostsController < ResourceController::Base
  
  before_filter :login_required

  def index
    @diario_de_classe_posts = DiarioDeClassePost.find(:all, :conditions => "user_id = "+current_user.id.to_s, :order => "created_at DESC")
  end
  
  def create
    
    post_p = params[:diario_de_classe_post]
    
    post = DiarioDeClassePost.new
    post.title = post_p[:title]
    post.body = post_p[:body]
    post.user_id = current_user.id
    post.tag_list = post_p[:tag_list]
    post.save
    
    redirect_to :controller => 'diario_de_classe_posts', :action => 'index'

  end

  def list_classrooms
    #@classrooms = current_user.classrooms.find(:all)
  end
  
  def new 
    @classrooms = current_user.classrooms.find(:all)
  end
end
